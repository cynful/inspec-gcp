# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
require 'google/compute/property/router_bgp'
require 'google/compute/property/router_bgp_advertised_ip_ranges'

# A provider to manage Compute Engine resources.
class Router < GcpResourceBase
  name 'google_compute_router'
  desc 'Router'
  supports platform: 'gcp'

  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :description
  attr_reader :network
  attr_reader :bgp
  attr_reader :region
  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/regions/{{region}}/routers/{{name}}'
  end

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(base, url, params)
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched['id']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @name = @fetched['name']
    @description = @fetched['description']
    @network = @fetched['network']
    @bgp = GoogleInSpec::Compute::Property::RouterBgp.new(@fetched['bgp'])
    @region = @fetched['region']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end
end
