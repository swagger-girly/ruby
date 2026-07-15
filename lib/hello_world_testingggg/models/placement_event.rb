# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # A placement history entry; the shape depends on the event kind and carries no
    # discriminator mapping.
    module PlacementEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      variant -> { HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent }

      variant -> { HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent }

      variant -> { HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent }

      class PlacementTransferEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute leg
        #
        #   @return [HelloWorldTestingggg::Models::TransferLeg]
        required :leg, -> { HelloWorldTestingggg::TransferLeg }

        # @!attribute occurred_at
        #
        #   @return [Time]
        required :occurred_at, Time, api_name: :occurredAt

        # @!attribute type
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent::Type]
        required :type, enum: -> { HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type }

        # @!attribute note
        #
        #   @return [String, nil]
        optional :note, String, nil?: true

        # @!method initialize(id:, leg:, occurred_at:, type:, note: nil)
        #   @param id [String]
        #   @param leg [HelloWorldTestingggg::Models::TransferLeg]
        #   @param occurred_at [Time]
        #   @param type [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent::Type]
        #   @param note [String, nil]

        # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent#type
        module Type
          extend HelloWorldTestingggg::Internal::Type::Enum

          TRANSFER = :transfer

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class PlacementCheckupEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute occurred_at
        #
        #   @return [Time]
        required :occurred_at, Time, api_name: :occurredAt

        # @!attribute type
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent::Type]
        required :type, enum: -> { HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type }

        # @!attribute follow_up
        #
        #   @return [HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent::FollowUp, nil]
        optional :follow_up,
                 -> { HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp },
                 api_name: :followUp

        # @!attribute note
        #
        #   @return [String, nil]
        optional :note, String, nil?: true

        # @!attribute record
        #
        #   @return [HelloWorldTestingggg::Models::VaccinationRecord, nil]
        optional :record, -> { HelloWorldTestingggg::VaccinationRecord }

        # @!method initialize(id:, occurred_at:, type:, follow_up: nil, note: nil, record: nil)
        #   @param id [String]
        #   @param occurred_at [Time]
        #   @param type [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent::Type]
        #   @param follow_up [HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent::FollowUp]
        #   @param note [String, nil]
        #   @param record [HelloWorldTestingggg::Models::VaccinationRecord]

        # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent#type
        module Type
          extend HelloWorldTestingggg::Internal::Type::Enum

          CHECKUP = :checkup

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent#follow_up
        class FollowUp < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute due
          #
          #   @return [Time, nil]
          optional :due, Time

          # @!attribute reason
          #
          #   @return [String, nil]
          optional :reason, String

          # @!method initialize(due: nil, reason: nil)
          #   @param due [Time]
          #   @param reason [String]
        end
      end

      class PlacementDisruptionEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute occurred_at
        #
        #   @return [Time]
        required :occurred_at, Time, api_name: :occurredAt

        # @!attribute severity
        #   A numeric severity score or a structured assessment.
        #
        #   @return [Integer, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment]
        required :severity, union: -> { HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity }

        # @!attribute type
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Type]
        required :type, enum: -> { HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type }

        # @!attribute note
        #
        #   @return [String, nil]
        optional :note, String, nil?: true

        # @!method initialize(id:, occurred_at:, severity:, type:, note: nil)
        #   @param id [String]
        #
        #   @param occurred_at [Time]
        #
        #   @param severity [Integer, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment] A numeric severity score or a structured assessment.
        #
        #   @param type [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Type]
        #
        #   @param note [String, nil]

        # A numeric severity score or a structured assessment.
        #
        # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent#severity
        module Severity
          extend HelloWorldTestingggg::Internal::Type::Union

          variant Integer

          variant -> { HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment }

          class Assessment < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute level
            #
            #   @return [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level]
            required :level,
                     enum: -> { HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level }

            # @!attribute reviewer
            #
            #   @return [String, nil]
            optional :reviewer, String

            # @!method initialize(level:, reviewer: nil)
            #   @param level [Symbol, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level]
            #   @param reviewer [String]

            # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment#level
            module Level
              extend HelloWorldTestingggg::Internal::Type::Enum

              LOW = :low
              HIGH = :high
              CRITICAL = :critical

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(Integer, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment)]
        end

        # @see HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent#type
        module Type
          extend HelloWorldTestingggg::Internal::Type::Enum

          DISRUPTION = :disruption

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent)]
    end
  end
end
