# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Store
      class Reports
        # Access to Petstore orders
        class Inventory
          # Access to Petstore orders
          # @return [HelloWorldTestingggg::Resources::Store::Reports::Inventory::Daily]
          attr_reader :daily

          # Returns inventory rows associated with a store report.
          #
          # @overload list(report_id, request_options: {})
          #
          # @param report_id [String] Report identifier.
          #
          # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [HelloWorldTestingggg::Models::Store::InventoryResponse]
          #
          # @see HelloWorldTestingggg::Models::Store::Reports::InventoryListParams
          def list(report_id, params = {})
            @client.request(
              method: :get,
              path: ["store/reports/%1$s/inventory", report_id],
              model: HelloWorldTestingggg::Store::InventoryResponse,
              options: params[:request_options]
            )
          end

          # @api private
          #
          # @param client [HelloWorldTestingggg::Client]
          def initialize(client:)
            @client = client
            @daily = HelloWorldTestingggg::Resources::Store::Reports::Inventory::Daily.new(client: client)
          end
        end
      end
    end
  end
end
