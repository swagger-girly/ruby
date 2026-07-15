# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # @see HelloWorldTestingggg::Resources::Adoptions::Policies#list
      class PolicyListParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute cursor
        #   Cursor from a previous response used to fetch the next page.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of policies to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(cursor: nil, limit: nil, request_options: {})
        #   @param cursor [String] Cursor from a previous response used to fetch the next page.
        #
        #   @param limit [Integer] Maximum number of policies to return.
        #
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
