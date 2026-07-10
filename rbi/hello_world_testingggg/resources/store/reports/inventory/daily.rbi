# typed: strong

module HelloWorldTestingggg
  module Resources
    class Store
      class Reports
        class Inventory
          # Access to Petstore orders
          class Daily
            # Returns daily inventory metrics for a generated report.
            sig do
              params(
                date: Date,
                report_id: String,
                request_options: HelloWorldTestingggg::RequestOptions::OrHash
              ).returns(HelloWorldTestingggg::Store::DailyInventory)
            end
            def retrieve(
              # Inventory report date.
              date,
              # Report identifier.
              report_id:,
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
end
