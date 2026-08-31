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

      # Returns a single activity feed entry. The response is a discriminated union
      # whose arms each compose the public `Pet` model, so every arm is minted under the
      # response's namespace and must inherit rather than flatten.
      #
      # @overload retrieve_activity(activity_id, request_options: {})
      #
      # @param activity_id [String] Identifier of the activity entry
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred]
      #
      # @see HelloWorldTestingggg::Models::StoreRetrieveActivityParams
      def retrieve_activity(activity_id, params = {})
        @client.request(
          method: :get,
          path: ["store/activity/%1$s", activity_id],
          model: HelloWorldTestingggg::Models::StoreRetrieveActivityResponse,
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
