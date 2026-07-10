# typed: strong

module HelloWorldTestingggg
  module Resources
    class Store
      class Reports
        # Access to Petstore orders
        class Inventory
          # Access to Petstore orders
          sig do
            returns(
              HelloWorldTestingggg::Resources::Store::Reports::Inventory::Daily
            )
          end
          attr_reader :daily

          # Returns inventory rows associated with a store report.
          sig do
            params(
              report_id: String,
              request_options: HelloWorldTestingggg::RequestOptions::OrHash
            ).returns(HelloWorldTestingggg::Store::InventoryResponse)
          end
          def list(
            # Report identifier.
            report_id,
            request_options: {}
          )
          end

          # @api private
          sig do
            params(client: HelloWorldTestingggg::Client).returns(
              T.attached_class
            )
          end
          def self.new(client:)
          end
        end
      end
    end
  end
end
