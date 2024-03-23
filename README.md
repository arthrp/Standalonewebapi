# Standalonewebapi

Simple containerized web app with no dependencies. 

## How to run

This short guide assumes you're using minikube.

Currently it will try to pull `localhost:5000/swapi` image
assuming you have set up a local registry on port 5000 (see [instructions](https://minikube.sigs.k8s.io/docs/handbook/registry/#enabling-insecure-registries/))
and pushed there the image built from dockerfile in the root.

After applying both `deployment.yaml` and `service.yaml` you will notice your LB service has no external IP.
To fix that, run a tunnel with `minikube tunnel` in the other terminal. Now external IP should appear.
