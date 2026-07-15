# typed: strong

module HelloWorldTestingggg
  module Resources
    class Store
      # Access to Petstore orders
      class Order
        # Place a new order in the store
        sig do
          params(
            id: Integer,
            complete: T::Boolean,
            pet_id: Integer,
            quantity: Integer,
            ship_date: Time,
            status:
              HelloWorldTestingggg::Store::OrderCreateParams::Status::OrSymbol,
            total: HelloWorldTestingggg::Money::OrHash,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Models::Store::OrderCreateResponse)
        end
        def create(
          id: nil,
          complete: nil,
          pet_id: nil,
          quantity: nil,
          ship_date: nil,
          # Order Status
          status: nil,
          total: nil,
          request_options: {}
        )
        end

        # For valid response try integer IDs with value <= 5 or > 10. Other values will
        # generate exceptions.
        sig do
          params(
            order_id: Integer,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Models::Store::OrderRetrieveResponse)
        end
        def retrieve(
          # ID of order that needs to be fetched
          order_id,
          request_options: {}
        )
        end

        # For valid response try integer IDs with value < 1000. Anything above 1000 or
        # nonintegers will generate API errors
        sig do
          params(
            order_id: Integer,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).void
        end
        def delete(
          # ID of the order that needs to be deleted
          order_id,
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
end
