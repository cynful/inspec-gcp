---
title: About the google_compute_target_http_proxies resource
platform: gcp
---

## Syntax
A `google_compute_target_http_proxies` is used to test a Google TargetHttpProxy resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_compute_target_http_proxies(project: 'chef-gcp-inspec') do
  its('names') { should include 'inspec-gcp-http-proxy' }
  its('descriptions') { should include 'A HTTP proxy' }
end
```

## Properties
Properties that can be accessed from the `google_compute_target_http_proxies` resource:

See [google_compute_target_http_proxy.md](google_compute_target_http_proxy.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_target_http_proxy` creation_timestamp
  * `descriptions`: an array of `google_compute_target_http_proxy` description
  * `ids`: an array of `google_compute_target_http_proxy` id
  * `names`: an array of `google_compute_target_http_proxy` name
  * `url_maps`: an array of `google_compute_target_http_proxy` url_map

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
