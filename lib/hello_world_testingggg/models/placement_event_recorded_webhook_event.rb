# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class PlacementEventRecordedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute event
      #   A placement history entry; the shape depends on the event kind and carries no
      #   discriminator mapping.
      #
      #   @return [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent]
      required :event, union: -> { HelloWorldTestingggg::PlacementEvent }

      # @!attribute placement_id
      #
      #   @return [String]
      required :placement_id, String, api_name: :placementId

      # @!attribute type
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PlacementEventRecordedWebhookEvent::Type]
      required :type, enum: -> { HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type }

      # @!attribute trigger_value
      #   The policy rule value that triggered this event, if any.
      #
      #   @return [String, Integer, Float, Array<String>, Time, nil]
      optional :trigger_value,
               union: -> { HelloWorldTestingggg::Adoptions::ConditionValue },
               api_name: :triggerValue

      # @!method initialize(event:, placement_id:, type:, trigger_value: nil)
      #   Some parameter documentations has been truncated, see
      #   {HelloWorldTestingggg::Models::PlacementEventRecordedWebhookEvent} for more
      #   details.
      #
      #   @param event [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent] A placement history entry; the shape depends on the event kind and carries no di
      #
      #   @param placement_id [String]
      #
      #   @param type [Symbol, HelloWorldTestingggg::Models::PlacementEventRecordedWebhookEvent::Type]
      #
      #   @param trigger_value [String, Integer, Float, Array<String>, Time] The policy rule value that triggered this event, if any.

      # @see HelloWorldTestingggg::Models::PlacementEventRecordedWebhookEvent#type
      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        PLACEMENT_EVENT_RECORDED = :"placement.event-recorded"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
