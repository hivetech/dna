# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  Backend workers powered by celery
  =================================

  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''

import os
import time
import flask
from flask.ext import restful
from flask_restful.utils import cors
from celery import Celery
import dna.time_utils


# NOTE Should use mongodb as it's already the app database ?
def setup(title, output='json', timezone=None):
    ''' Implement celery workers using json and redis '''
    timezone = timezone or dna.time_utils._detect_timezone()

    broker_url = 'redis://{}:{}/{}'.format(
        os.environ.get('BROKER_HOST', 'localhost'),
        os.environ.get('BROKER_PORT', 6379),
        0
    )

    app = Celery(title, broker=broker_url)

    app.conf.update(
        CELERY_TASK_SERIALIZER=output,
        CELERY_ACCEPT_CONTENT=[output],  # Ignore other content
        CELERY_RESULT_SERIALIZER=output,
        CELERY_RESULT_BACKEND=broker_url,
        CELERY_TIMEZONE=timezone,
        CELERYD_FORCE_EXECV=True,
        CELERY_ENABLE_UTC=True,
        CELERY_IGNORE_RESULT=False
    )

    return app


class RestfulWorker(restful.Resource):
    ''' Tasks manager '''

    jobs = {}

    def _inspect_worker(self, worker_id):
        elapsed = time.time() - self.jobs[worker_id]['start']
        worker = self.jobs[worker_id]['worker']

        report = {
            'elapsed': elapsed,
            'id': worker_id,
            'done': worker.ready(),
            'task_id': worker.id,
            'task': worker.task_name,
            'status': worker.status,
            'state': worker.state
        }
        if worker.ready():
            report.update({
                'successful': worker.successful(),
                'failed': worker.failed()})
            if worker.successful():
                report['result'] = worker.get()
            else:
                report['traceback'] = worker.traceback
                report['result'] = str(worker.get(propagate=False))
        return report

    def trigger_worker(self, worker_id, job, *args, **kwargs):
        # worker = job.delay(*args, **kwargs)
        worker = job.apply_async(args=args, kwargs=kwargs)
        self.jobs[worker_id] = {
            'worker': worker,
            'start': time.time()
        }

        return {
            'enqueued': True,
            'id': worker_id,
            'task_id': worker.task_id,
            'start': time.time()
        }

    @cors.crossdomain(origin='*')
    def get(self, worker_id):
        ''' Return status report '''
        code = 200

        if worker_id == 'all':
            report = {'workers': [{
                'id': job,
                'report': self._inspect_worker(job)}
                for job in self.jobs]
            }

        elif worker_id in self.jobs:
            report = {
                'id': worker_id,
                'report': self._inspect_worker(worker_id)
            }

        else:
            report = {'error': 'job {} unknown'.format(worker_id)}
            code = 404

        return flask.jsonify(report), code

    @cors.crossdomain(origin='*')
    def delete(self, worker_id):
        ''' Stop and remove a worker '''
        code = 200

        if worker_id in self.jobs:
            # NOTE pop it if done ?
            self.jobs[worker_id]['worker'].revoke(terminate=True)
            report = {
                'id': worker_id,
                'revoked': True
                # FIXME Unable to serialize self.jobs[worker_id]
                # 'session': self.jobs.pop(worker_id)
            }
            self.jobs.pop(worker_id)
        else:
            report = {'error': 'job {} unknown'.format(worker_id)}
            code = 404

        return flask.jsonify(report), code

    @cors.crossdomain(origin='*')
    def options(self, worker_id):
        return flask.jsonify({}), 200
