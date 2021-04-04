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
	coverage run --source=. --omit="*/test*" -m pytest
	coverage report -m
	coverage html

