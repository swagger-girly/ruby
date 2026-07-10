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

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
