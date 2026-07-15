# typed: strong

module HelloWorldTestingggg
  module Resources
    # Post-adoption placement tracking
    class Placements
      # Creates a placement for an approved adoption application.
      sig do
        params(
          application_id: String,
          initial_event:
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
            ),
          logistics:
            HelloWorldTestingggg::PlacementCreateParams::Logistics::OrHash,
          scheduled_for: Time,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Placement)
      end
      def create(
        application_id:,
        # A placement history entry; the shape depends on the event kind and carries no
        # discriminator mapping.
        initial_event: nil,
        # Transport plan for a placement; pickup and delivery share the transfer-leg
        # shape.
        logistics: nil,
        scheduled_for: nil,
        request_options: {}
      )
      end

      # Returns a single placement, including its adoption application and event
      # history.
      sig do
        params(
          placement_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Placement)
      end
      def retrieve(
        # Placement identifier.
        placement_id,
        request_options: {}
      )
      end

      # Returns a cursor-paginated list of placements.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Internal::CustomCursorPage[
            HelloWorldTestingggg::Placement
          ]
        )
      end
      def list(
        # Cursor from a previous response used to fetch the next page.
        cursor: nil,
        # Maximum number of placements to return.
        limit: nil,
        request_options: {}
      )
      end

      # Appends a transfer, checkup, or disruption event to a placement's history.
      sig do
        params(
          placement_id: String,
          placement_event:
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
            ),
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Placement)
      end
      def record_event(
        # Placement identifier.
        placement_id,
        # A placement history entry; the shape depends on the event kind and carries no
        # discriminator mapping.
        placement_event:,
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
