.PHONY: all
all:test

.PHONY: test
test:
	pipenv run pytest

.PHONY: build
build:
	pipenv install --dev

.PHONY: cover
cover:
	pipenv run coverage run --source=. --omit="*/test*" -m pytest
	pipenv run coverage report -m
	pipenv run coverage html

