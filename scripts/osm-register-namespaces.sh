#!/bin/bash

log() { echo "$1" >&2; }

NAMESPACES=($@)
if [[ -z "$NAMESPACES" ]]; then
	log "osm-register-namespaces.sh <namespace1> <namespace2>"
	exit 1
fi

set -euo pipefail

for i in ${NAMESPACES[@]}; 
do 
    # Create namespace
    kubectl create ns $i;

    # Add namespace to OSM monitored namespace list
    kubectl label ns $i openservicemesh.io/monitored-by=osm

    # Enable OSM sidecar injection on a namespace
    kubectl annotate ns $i openservicemesh.io/sidecar-injection=enabled

    log "Successfully registered namespace '$i' with OSM."
done