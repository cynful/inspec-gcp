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
require 'google/memcache/property/instance_memcache_parameters'
require 'google/memcache/property/instance_node_config'

# A provider to manage Memcache resources.
class MemcacheInstance < GcpResourceBase
  name 'google_memcache_instance'
  desc 'Instance'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :display_name
  attr_reader :create_time
  attr_reader :labels
  attr_reader :zones
  attr_reader :authorized_network
  attr_reader :node_count
  attr_reader :node_config
  attr_reader :memcache_parameters
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @display_name = @fetched['displayName']
    @create_time = parse_time_string(@fetched['createTime'])
    @labels = @fetched['labels']
    @zones = @fetched['zones']
    @authorized_network = @fetched['authorizedNetwork']
    @node_count = @fetched['nodeCount']
    @node_config = GoogleInSpec::Memcache::Property::InstanceNodeConfig.new(@fetched['nodeConfig'], to_s)
    @memcache_parameters = GoogleInSpec::Memcache::Property::InstanceMemcacheParameters.new(@fetched['memcacheParameters'], to_s)
    @region = @fetched['region']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Instance #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://memcache.googleapis.com/v1beta2/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{region}}/instances/{{name}}'
  end
end
