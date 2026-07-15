# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Post-adoption placement tracking
    class Placements
      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::PlacementCreateParams} for more details.
      #
      # Creates a placement for an approved adoption application.
      #
      # @overload create(application_id:, initial_event: nil, logistics: nil, scheduled_for: nil, request_options: {})
      #
      # @param application_id [String]
      #
      # @param initial_event [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent] A placement history entry; the shape depends on the event kind and carries no di
      #
      # @param logistics [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics] Transport plan for a placement; pickup and delivery share the transfer-leg shape
      #
      # @param scheduled_for [Time]
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Placement]
      #
      # @see HelloWorldTestingggg::Models::PlacementCreateParams
      def create(params)
        parsed, options = HelloWorldTestingggg::PlacementCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "placements",
          body: parsed,
          model: HelloWorldTestingggg::Placement,
          options: options
        )
      end

      # Returns a single placement, including its adoption application and event
      # history.
      #
      # @overload retrieve(placement_id, request_options: {})
      #
      # @param placement_id [String] Placement identifier.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Placement]
      #
      # @see HelloWorldTestingggg::Models::PlacementRetrieveParams
      def retrieve(placement_id, params = {})
        @client.request(
          method: :get,
          path: ["placements/%1$s", placement_id],
          model: HelloWorldTestingggg::Placement,
          options: params[:request_options]
        )
      end

      # Returns a cursor-paginated list of placements.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Cursor from a previous response used to fetch the next page.
      #
      # @param limit [Integer] Maximum number of placements to return.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Internal::CustomCursorPage<HelloWorldTestingggg::Models::Placement>]
      #
      # @see HelloWorldTestingggg::Models::PlacementListParams
      def list(params = {})
        parsed, options = HelloWorldTestingggg::PlacementListParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "placements",
          query: query,
          page: HelloWorldTestingggg::Internal::CustomCursorPage,
          model: HelloWorldTestingggg::Placement,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::PlacementRecordEventParams} for more details.
      #
      # Appends a transfer, checkup, or disruption event to a placement's history.
      #
      # @overload record_event(placement_id, placement_event:, request_options: {})
      #
      # @param placement_id [String] Placement identifier.
      #
      # @param placement_event [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent] A placement history entry; the shape depends on the event kind and carries no di
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Placement]
      #
      # @see HelloWorldTestingggg::Models::PlacementRecordEventParams
      def record_event(placement_id, params)
        parsed, options = HelloWorldTestingggg::PlacementRecordEventParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["placements/%1$s/events", placement_id],
          body: parsed[:placement_event],
          model: HelloWorldTestingggg::Placement,
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
