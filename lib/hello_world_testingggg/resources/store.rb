# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Access to Petstore orders
    class Store
      # Access to Petstore orders
      # @return [HelloWorldTestingggg::Resources::Store::Order]
      attr_reader :order

      # Access to Petstore orders
      # @return [HelloWorldTestingggg::Resources::Store::Reports]
      attr_reader :reports

      # Returns a map of status codes to quantities
      #
      # @overload list_inventory(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Hash{Symbol=>Integer}]
      #
      # @see HelloWorldTestingggg::Models::StoreListInventoryParams
      def list_inventory(params = {})
        @client.request(
          method: :get,
          path: "store/inventory",
          model: HelloWorldTestingggg::Internal::Type::HashOf[Integer],
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
        @order = HelloWorldTestingggg::Resources::Store::Order.new(client: client)
        @reports = HelloWorldTestingggg::Resources::Store::Reports.new(client: client)
      end
    end
  end
end
