# typed: strong

module HelloWorldTestingggg
  module Resources
    # Access to Petstore orders
    class Store
      # Access to Petstore orders
      sig { returns(HelloWorldTestingggg::Resources::Store::Order) }
      attr_reader :order

      # Access to Petstore orders
      sig { returns(HelloWorldTestingggg::Resources::Store::Reports) }
      attr_reader :reports

      # Returns a map of status codes to quantities
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, Integer])
      end
      def list_inventory(request_options: {})
      end

      # Returns a single activity feed entry. The response is a discriminated union
      # whose arms each compose the public `Pet` model, so every arm is minted under the
      # response's namespace and must inherit rather than flatten.
      sig do
        params(
          activity_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Variants
        )
      end
      def retrieve_activity(
        # Identifier of the activity entry
        activity_id,
        request_options: {}
      )
      end

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
