# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Reports#list
      class ReportListParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute ending_before
        #   Return reports before this report id.
        #
        #   @return [String, nil]
        optional :ending_before, String

        # @!attribute page_size
        #   Maximum number of reports to return.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute starting_after
        #   Return reports after this report id.
        #
        #   @return [String, nil]
        optional :starting_after, String

        # @!method initialize(ending_before: nil, page_size: nil, starting_after: nil, request_options: {})
        #   @param ending_before [String] Return reports before this report id.
        #
        #   @param page_size [Integer] Maximum number of reports to return.
        #
        #   @param starting_after [String] Return reports after this report id.
        #
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
