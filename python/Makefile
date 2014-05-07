# Makefile
# vim:ft=make

all:
	python setup.py install

package:
	#python setup.py register
	python setup.py sdist
	git tag ${VERSION}
	git push --tags
	python setup.py sdist upload

tests: warn_missing_linters
	flake8 --ignore E265 tests dna
	nosetests -w tests --with-yanc --with-coverage --cover-package=dna

watch: warn_missing_linters
	watchmedo shell-command \
    --patterns="*.py;*.txt" \
    --recursive \
    --command="make tests" .

present_pep8=$(shell which pep8)
present_pyflakes=$(shell which pyflakes)
warn_missing_linters:
	@test -n "$(present_pep8)" || echo "WARNING: pep8 not installed."
	@test -n "$(present_pyflakes)" || echo "WARNING: pyflakes not installed."

.PHONY: install warn_missing_linters tests package
