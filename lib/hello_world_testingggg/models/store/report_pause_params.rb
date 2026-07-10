# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Reports#pause
      class ReportPauseParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute report_id
        #
        #   @return [String]
        required :report_id, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(report_id:, idempotency_key: nil, request_options: {})
        #   @param report_id [String]
        #   @param idempotency_key [String]
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
