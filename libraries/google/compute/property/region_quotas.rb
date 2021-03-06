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
module GoogleInSpec
  module Compute
    module Property
      class RegionQuotas
        attr_reader :metric

        attr_reader :limit

        attr_reader :usage

        attr_reader :owner

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @metric = args['metric']
          @limit = args['limit']
          @usage = args['usage']
          @owner = args['owner']
        end

        def to_s
          "#{@parent_identifier} RegionQuotas"
        end
      end

      class RegionQuotasArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionQuotas.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionQuotas.new(v, parent_identifier) }
        end
      end
    end
  end
end
