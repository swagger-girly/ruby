# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Order#retrieve
      class OrderRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute order_id
        #
        #   @return [Integer]
        required :order_id, Integer

        # @!method initialize(order_id:, request_options: {})
        #   @param order_id [Integer]
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
