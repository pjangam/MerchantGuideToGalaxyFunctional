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

.PHONY: badge
badge:
	$(eval TOTAL=$(shell make cover|grep TOTAL|grep -Eo '[0-9]+'|tail -1))
	echo $(TOTAL)
	$(eval COLOR=red)
	$(if $(shell [ $(TOTAL) -ge 50 ] && echo "OK"), \
		$(eval COLOR := orange), \
		$(eval BAR := false))
	$(if $(shell [ $(TOTAL) -ge 80 ] && echo "OK"), \
		$(eval COLOR := green), \
		$(eval BAR := false))
	echo $(COLOR)
	curl "https://img.shields.io/badge/coavrege-$(TOTAL)%25-$(COLOR)" > badge.svg
