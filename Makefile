# Makefile for the Docker image upmcenterprises/cerebro
# MAINTAINER: Steve Sloka <slokas@upmc.edu>

.PHONY: all container push

TAG ?= 0.6.8
PREFIX ?= upmcenterprises

all: container

container: 
	docker build -t $(PREFIX)/cerebro:$(TAG) .

push:
	docker push $(PREFIX)/cerebro:$(TAG)