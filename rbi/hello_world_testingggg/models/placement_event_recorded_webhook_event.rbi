# typed: strong

module HelloWorldTestingggg
  module Models
    class PlacementEventRecordedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PlacementEventRecordedWebhookEvent,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # A placement history entry; the shape depends on the event kind and carries no
      # discriminator mapping.
      sig { returns(HelloWorldTestingggg::PlacementEvent::Variants) }
      attr_accessor :event

      sig { returns(String) }
      attr_accessor :placement_id

      sig do
        returns(
          HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # The policy rule value that triggered this event, if any.
      sig do
        returns(
          T.nilable(HelloWorldTestingggg::Adoptions::ConditionValue::Variants)
        )
      end
      attr_reader :trigger_value

      sig do
        params(
          trigger_value:
            HelloWorldTestingggg::Adoptions::ConditionValue::Variants
        ).void
      end
      attr_writer :trigger_value

      sig do
        params(
          event:
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
            ),
          placement_id: String,
          type:
            HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type::OrSymbol,
          trigger_value:
            HelloWorldTestingggg::Adoptions::ConditionValue::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # A placement history entry; the shape depends on the event kind and carries no
        # discriminator mapping.
        event:,
        placement_id:,
        type:,
        # The policy rule value that triggered this event, if any.
        trigger_value: nil
      )
      end

      sig do
        override.returns(
          {
            event: HelloWorldTestingggg::PlacementEvent::Variants,
            placement_id: String,
            type:
              HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type::TaggedSymbol,
            trigger_value:
              HelloWorldTestingggg::Adoptions::ConditionValue::Variants
          }
        )
      end
      def to_hash
      end

      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PLACEMENT_EVENT_RECORDED =
          T.let(
            :"placement.event-recorded",
            HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::PlacementEventRecordedWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
