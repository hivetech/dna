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
from celery import Celery
import dna.apy.utils
import dna.time_utils


def setup(title, output='json', timezone=None):
    ''' Implement celery workers using json and redis '''
    timezone = timezone or dna.time_utils._detect_timezone()

    broker_url = 'redis://{}:{}/0'.format(
        os.environ.get('BROKER_HOST', 'localhost'),
        os.environ.get('BROKER_PORT', 6379)
    )

    app = Celery(title, backend=broker_url, broker=broker_url)

    app.conf.update(
        CELERY_TASK_SERIALIZER=output,
        CELERY_ACCEPT_CONTENT=[output],  # Ignore other content
        CELERY_RESULT_SERIALIZER=output,
        CELERY_TIMEZONE=timezone,
        CELERY_ENABLE_UTC=True,
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
        worker = job.delay(*args, **kwargs)

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

    @dna.apy.utils.crossdomain(origin='*')
    def get(self, worker_id):
        ''' Return status report '''
        code = 200

        if worker_id == 'all':
            report = {
                worker_id: self._inspect_worker(worker_id)
                for worker_id in self.jobs
            }

        elif worker_id in self.jobs:
            report = self._inspect_worker(worker_id)

        else:
            report = {'error': 'job {} unknown'.format(worker_id)}
            code = 404

        return flask.jsonify(report), code

    def delete(self, worker_id):
        ''' Stop and remove a worker '''
        if worker_id in self.jobs:
            # NOTE pop it if done ?
            self.jobs[worker_id]['worker'].revoke(terminate=True)
            report = {
                'id': worker_id,
                'revoked': True,
                'session': self.jobs[worker_id]
            }
        else:
            report = {'error': 'job {} unknown'.format(worker_id)}

        return report
