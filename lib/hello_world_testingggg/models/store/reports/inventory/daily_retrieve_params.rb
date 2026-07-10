# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      module Reports
        module Inventory
          # @see HelloWorldTestingggg::Resources::Store::Reports::Inventory::Daily#retrieve
          class DailyRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
            extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
            include HelloWorldTestingggg::Internal::Type::RequestParameters

            # @!attribute report_id
            #
            #   @return [String]
            required :report_id, String

            # @!attribute date
            #
            #   @return [Date]
            required :date, Date

            # @!method initialize(report_id:, date:, request_options: {})
            #   @param report_id [String]
            #   @param date [Date]
            #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
