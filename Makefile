#
# Summary: Makefile to create Docker container image for PostgreSQL automatically
# Author: Daniel Peña <dppascual@gmail.com>
#
all: build

build:
	@docker build -t "dppascual/postgresql:$$(cat VERSION)" .
