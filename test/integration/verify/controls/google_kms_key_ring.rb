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

title 'Test GCP google_kms_key_ring resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'GCP location')
gcp_kms_key_ring_policy_name = attribute(:gcp_kms_key_ring_policy_name, default: 'gcp_kms_key_ring_policy_name', description: 'Key ring name')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default: 'gcp_enable_privileged_resources', description: 'If we are running tests with escalated permissions(required for this test)')
control 'google_kms_key_ring-1.0' do
  impact 1.0
  title 'google_kms_key_ring resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  describe google_kms_key_ring(project: gcp_project_id, location: gcp_location, name: gcp_kms_key_ring_policy_name) do
    it { should exist }
    its('create_time') { should be > Time.now - 365*60*60*24*10 }
    its('key_ring_name'){ should eq gcp_kms_key_ring_policy_name }
    its('key_ring_url'){ should match gcp_kms_key_ring_policy_name }
  end

  describe google_kms_key_ring(project: gcp_project_id, location: gcp_location, name: "nonexistent") do
    it { should_not exist }
  end
end