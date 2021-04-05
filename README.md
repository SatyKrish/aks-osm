# AKS Integration With Open Service Mesh Add-on

A reference implementation for AKS integration with Open Service Mesh add-on.

## Introduction

[Open Service Mesh (OSM)](https://docs.openservicemesh.io/) is a lightweight, extensible, Cloud Native service mesh that allows users to uniformly manage, secure, and get out-of-the-box observability features for highly dynamic microservice environments.

OSM runs an Envoy-based control plane on Kubernetes, can be configured with SMI APIs, and works by injecting an Envoy proxy as a sidecar container next to each instance of your application. The Envoy proxy contains and executes rules around access control policies, implements routing configuration, and captures metrics. The control plane continually configures proxies to ensure policies and routing rules are up to date and ensures proxies are healthy.

### Capabilities and Features

OSM provides the following set of capabilities and features to provide a cloud native service mesh for your Azure Kubernetes Service (AKS) clusters:

* Secure service to service communication by enabling mTLS

* Easily onboard applications onto the mesh by enabling automatic sidecar injection of Envoy proxy

* Easily and transparent configurations for traffic shifting on deployments

* Ability to define and execute fine grained access control policies for services

* Observability and insights into application metrics for debugging and monitoring services

* Integration with external certificate management services/solutions with a pluggable interface


## Prerequisites

To create an AKS cluster that can use the Open Service Mesh add-on, you must enable the AKS-OpenServiceMesh feature flag on your subscription.

### Register the AKS-OpenServiceMesh preview feature

Register the `AKS-OpenServiceMesh` feature flag by using the az feature register command, as shown in the following example:

```sh
$ az feature register --namespace "Microsoft.ContainerService" --name "AKS-OpenServiceMesh"
```

It takes a few minutes for the status to show Registered. Verify the registration status by using the az feature list command:

```sh
$ az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/AKS-OpenServiceMesh')].{Name:name,State:properties.state}"
```

When ready, refresh the registration of the Microsoft.ContainerService resource provider by using the `az provider register` command:

```sh
$ az provider register --namespace Microsoft.ContainerService
```

