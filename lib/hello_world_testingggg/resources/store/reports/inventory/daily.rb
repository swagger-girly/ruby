# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Store
      class Reports
        class Inventory
          # Access to Petstore orders
          class Daily
            # Returns daily inventory metrics for a generated report.
            #
            # @overload retrieve(date, report_id:, request_options: {})
            #
            # @param date [Date] Inventory report date.
            #
            # @param report_id [String] Report identifier.
            #
            # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [HelloWorldTestingggg::Models::Store::DailyInventory]
            #
            # @see HelloWorldTestingggg::Models::Store::Reports::Inventory::DailyRetrieveParams
            def retrieve(date, params)
              parsed, options =
                HelloWorldTestingggg::Store::Reports::Inventory::DailyRetrieveParams.dump_request(params)
              report_id =
                parsed.delete(:report_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["store/reports/%1$s/inventory/daily/%2$s", report_id, date],
                model: HelloWorldTestingggg::Store::DailyInventory,
                options: options
              )
            end

            # @api private
            #
            # @param client [HelloWorldTestingggg::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
