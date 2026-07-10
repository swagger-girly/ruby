# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Store
      # Access to Petstore orders
      class Reports
        # Access to Petstore orders
        # @return [HelloWorldTestingggg::Resources::Store::Reports::Inventory]
        attr_reader :inventory

        # Returns a generated store report.
        #
        # @overload retrieve(report_id, request_options: {})
        #
        # @param report_id [String] Report identifier.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Models::Store::Report]
        #
        # @see HelloWorldTestingggg::Models::Store::ReportRetrieveParams
        def retrieve(report_id, params = {})
          @client.request(
            method: :get,
            path: ["store/reports/%1$s", report_id],
            model: HelloWorldTestingggg::Store::Report,
            options: params[:request_options]
          )
        end

        # Returns a cursor-id paginated list of generated store reports.
        #
        # @overload list(ending_before: nil, page_size: nil, starting_after: nil, request_options: {})
        #
        # @param ending_before [String] Return reports before this report id.
        #
        # @param page_size [Integer] Maximum number of reports to return.
        #
        # @param starting_after [String] Return reports after this report id.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Internal::ReportCursorPage<HelloWorldTestingggg::Models::Store::Report>]
        #
        # @see HelloWorldTestingggg::Models::Store::ReportListParams
        def list(params = {})
          parsed, options = HelloWorldTestingggg::Store::ReportListParams.dump_request(params)
          query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "store/reports",
            query: query,
            page: HelloWorldTestingggg::Internal::ReportCursorPage,
            model: HelloWorldTestingggg::Store::Report,
            options: options
          )
        end

        # Returns an embeddable HTML representation of a store report.
        #
        # @overload embed(report_id, request_options: {})
        #
        # @param report_id [String] Report identifier.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [String]
        #
        # @see HelloWorldTestingggg::Models::Store::ReportEmbedParams
        def embed(report_id, params = {})
          @client.request(
            method: :get,
            path: ["store/reports/%1$s/embed", report_id],
            headers: {"accept" => "text/html"},
            model: String,
            options: params[:request_options]
          )
        end

        # Pauses a report generation job and returns an empty success response.
        #
        # @overload pause(report_id, idempotency_key: nil, request_options: {})
        #
        # @param report_id [String] Report identifier.
        #
        # @param idempotency_key [String] Unique key used to safely retry report mutations.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see HelloWorldTestingggg::Models::Store::ReportPauseParams
        def pause(report_id, params = {})
          parsed, options = HelloWorldTestingggg::Store::ReportPauseParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["store/reports/%1$s/pause", report_id],
            headers: parsed.transform_keys(idempotency_key: "idempotency-key"),
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [HelloWorldTestingggg::Client]
        def initialize(client:)
          @client = client
          @inventory = HelloWorldTestingggg::Resources::Store::Reports::Inventory.new(client: client)
        end
      end
    end
  end
end
