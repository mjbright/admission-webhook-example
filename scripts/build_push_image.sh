#!/bin/bash

REPO="mjbright/admission-webhook-example"
TAG="v1"

IMAGE=${REPO}:${TAG}

echo; echo "---- Building image ${IMAGE} ..."
#docker build -t ${IMAGE} .
docker build -t ${IMAGE} -f Dockerfile.2stage .

echo; echo "---- Pushing  image ${IMAGE} ..."
docker push ${IMAGE}

