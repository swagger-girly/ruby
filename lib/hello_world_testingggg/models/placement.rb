# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Placements#create
    class Placement < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute application
      #
      #   @return [HelloWorldTestingggg::Models::Application]
      required :application, -> { HelloWorldTestingggg::Application }

      # @!attribute status
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Status]
      required :status, enum: -> { HelloWorldTestingggg::Placement::Status }

      # @!attribute activity
      #   Unified activity feed mixing event, milestone, and note entries.
      #
      #   @return [Array<HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementNote, HelloWorldTestingggg::Models::Placement::Activity::PlacementAdoptedMilestone, HelloWorldTestingggg::Models::Placement::Activity::PlacementReturnedMilestone>, nil]
      optional :activity,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::Placement::Activity] }

      # @!attribute events
      #
      #   @return [Array<HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent>, nil]
      optional :events,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::PlacementEvent] }

      # @!attribute follow_up_after
      #
      #   @return [Time, nil]
      optional :follow_up_after, Time, api_name: :followUpAfter, nil?: true

      # @!attribute logistics
      #   Transport plan for a placement; pickup and delivery share the transfer-leg
      #   shape.
      #
      #   @return [HelloWorldTestingggg::Models::Placement::Logistics, nil]
      optional :logistics, -> { HelloWorldTestingggg::Placement::Logistics }

      # @!attribute medical_clearance
      #
      #   @return [HelloWorldTestingggg::Models::MedicalSummary, nil]
      optional :medical_clearance, -> { HelloWorldTestingggg::MedicalSummary }, api_name: :medicalClearance

      response_only do
        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt
      end

      # @!method initialize(id:, application:, created_at:, status:, activity: nil, events: nil, follow_up_after: nil, logistics: nil, medical_clearance: nil)
      #   Some parameter documentations has been truncated, see
      #   {HelloWorldTestingggg::Models::Placement} for more details.
      #
      #   A post-adoption placement tracking the pet's transition to its new home.
      #
      #   @param id [String]
      #
      #   @param application [HelloWorldTestingggg::Models::Application]
      #
      #   @param created_at [Time]
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::Placement::Status]
      #
      #   @param activity [Array<HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementNote, HelloWorldTestingggg::Models::Placement::Activity::PlacementAdoptedMilestone, HelloWorldTestingggg::Models::Placement::Activity::PlacementReturnedMilestone>] Unified activity feed mixing event, milestone, and note entries.
      #
      #   @param events [Array<HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent>]
      #
      #   @param follow_up_after [Time, nil]
      #
      #   @param logistics [HelloWorldTestingggg::Models::Placement::Logistics] Transport plan for a placement; pickup and delivery share the transfer-leg shape
      #
      #   @param medical_clearance [HelloWorldTestingggg::Models::MedicalSummary]

      # @see HelloWorldTestingggg::Models::Placement#status
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        PENDING = :pending
        ACTIVE = :active
        COMPLETED = :completed
        DISRUPTED = :disrupted

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A unified placement activity-feed entry. An undiscriminated union-of-unions: two
      # branches are themselves unions (event kinds and milestones) and one is a plain
      # note.
      module Activity
        extend HelloWorldTestingggg::Internal::Type::Union

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent }

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent }

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent }

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementNote }

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementAdoptedMilestone }

        variant -> { HelloWorldTestingggg::Placement::Activity::PlacementReturnedMilestone }

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
          #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent::Type]
          required :type, enum: -> { HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type }

          # @!attribute note
          #
          #   @return [String, nil]
          optional :note, String, nil?: true

          # @!method initialize(id:, leg:, occurred_at:, type:, note: nil)
          #   @param id [String]
          #   @param leg [HelloWorldTestingggg::Models::TransferLeg]
          #   @param occurred_at [Time]
          #   @param type [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent::Type]
          #   @param note [String, nil]

          # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent#type
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
          #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent::Type]
          required :type, enum: -> { HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type }

          # @!attribute follow_up
          #
          #   @return [HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent::FollowUp, nil]
          optional :follow_up,
                   -> { HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp },
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
          #   @param type [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent::Type]
          #   @param follow_up [HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent::FollowUp]
          #   @param note [String, nil]
          #   @param record [HelloWorldTestingggg::Models::VaccinationRecord]

          # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent#type
          module Type
            extend HelloWorldTestingggg::Internal::Type::Enum

            CHECKUP = :checkup

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent#follow_up
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
          #   @return [Integer, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment]
          required :severity,
                   union: -> { HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity }

          # @!attribute type
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Type]
          required :type, enum: -> { HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type }

          # @!attribute note
          #
          #   @return [String, nil]
          optional :note, String, nil?: true

          # @!method initialize(id:, occurred_at:, severity:, type:, note: nil)
          #   @param id [String]
          #
          #   @param occurred_at [Time]
          #
          #   @param severity [Integer, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment] A numeric severity score or a structured assessment.
          #
          #   @param type [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Type]
          #
          #   @param note [String, nil]

          # A numeric severity score or a structured assessment.
          #
          # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent#severity
          module Severity
            extend HelloWorldTestingggg::Internal::Type::Union

            variant Integer

            variant -> { HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment }

            class Assessment < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute level
              #
              #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level]
              required :level,
                       enum: -> { HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level }

              # @!attribute reviewer
              #
              #   @return [String, nil]
              optional :reviewer, String

              # @!method initialize(level:, reviewer: nil)
              #   @param level [Symbol, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level]
              #   @param reviewer [String]

              # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment#level
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
            #   @return [Array(Integer, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment)]
          end

          # @see HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent#type
          module Type
            extend HelloWorldTestingggg::Internal::Type::Enum

            DISRUPTION = :disruption

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class PlacementNote < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute body
          #
          #   @return [String]
          required :body, String

          # @!attribute kind
          #
          #   @return [Symbol, :note]
          required :kind, const: :note

          # @!method initialize(body:, kind: :note)
          #   @param body [String]
          #   @param kind [Symbol, :note]
        end

        class PlacementAdoptedMilestone < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute adopted_at
          #
          #   @return [Time]
          required :adopted_at, Time, api_name: :adoptedAt

          # @!attribute kind
          #
          #   @return [Symbol, :adopted]
          required :kind, const: :adopted

          # @!method initialize(adopted_at:, kind: :adopted)
          #   @param adopted_at [Time]
          #   @param kind [Symbol, :adopted]
        end

        class PlacementReturnedMilestone < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute kind
          #
          #   @return [Symbol, :returned]
          required :kind, const: :returned

          # @!attribute reason
          #
          #   @return [String]
          required :reason, String

          # @!method initialize(reason:, kind: :returned)
          #   @param reason [String]
          #   @param kind [Symbol, :returned]
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::Placement::Activity::PlacementTransferEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementCheckupEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementDisruptionEvent, HelloWorldTestingggg::Models::Placement::Activity::PlacementNote, HelloWorldTestingggg::Models::Placement::Activity::PlacementAdoptedMilestone, HelloWorldTestingggg::Models::Placement::Activity::PlacementReturnedMilestone)]
      end

      # @see HelloWorldTestingggg::Models::Placement#logistics
      class Logistics < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute delivery
        #
        #   @return [HelloWorldTestingggg::Models::TransferLeg, nil]
        optional :delivery, -> { HelloWorldTestingggg::TransferLeg }

        # @!attribute handler
        #
        #   @return [HelloWorldTestingggg::Models::Placement::Logistics::Handler, nil]
        optional :handler, -> { HelloWorldTestingggg::Placement::Logistics::Handler }

        # @!attribute pickup
        #
        #   @return [HelloWorldTestingggg::Models::TransferLeg, nil]
        optional :pickup, -> { HelloWorldTestingggg::TransferLeg }

        # @!method initialize(delivery: nil, handler: nil, pickup: nil)
        #   Transport plan for a placement; pickup and delivery share the transfer-leg
        #   shape.
        #
        #   @param delivery [HelloWorldTestingggg::Models::TransferLeg]
        #   @param handler [HelloWorldTestingggg::Models::Placement::Logistics::Handler]
        #   @param pickup [HelloWorldTestingggg::Models::TransferLeg]

        # @see HelloWorldTestingggg::Models::Placement::Logistics#handler
        class Handler < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute certification
          #
          #   @return [HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification, nil]
          optional :certification, -> { HelloWorldTestingggg::Placement::Logistics::Handler::Certification }

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(certification: nil, name: nil)
          #   @param certification [HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification]
          #   @param name [String]

          # @see HelloWorldTestingggg::Models::Placement::Logistics::Handler#certification
          class Certification < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute level
            #
            #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Level]
            required :level, enum: -> { HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level }

            # @!attribute audit
            #   Provenance stamp attached to records across unrelated resources.
            #
            #   @return [HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Audit, nil]
            optional :audit, -> { HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit }

            # @!attribute issued_by
            #
            #   @return [String, nil]
            optional :issued_by, String, api_name: :issuedBy

            # @!method initialize(level:, audit: nil, issued_by: nil)
            #   @param level [Symbol, HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Level]
            #
            #   @param audit [HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Audit] Provenance stamp attached to records across unrelated resources.
            #
            #   @param issued_by [String]

            # @see HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification#level
            module Level
              extend HelloWorldTestingggg::Internal::Type::Enum

              STANDARD = :standard
              ADVANCED = :advanced
              SPECIALIST = :specialist

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification#audit
            class Audit < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute recorded_at
              #
              #   @return [Time]
              required :recorded_at, Time, api_name: :recordedAt

              # @!attribute recorded_by
              #
              #   @return [String, nil]
              optional :recorded_by, String, api_name: :recordedBy

              # @!attribute source
              #
              #   @return [Symbol, HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Audit::Source, nil]
              optional :source,
                       enum: -> { HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source }

              # @!method initialize(recorded_at:, recorded_by: nil, source: nil)
              #   Provenance stamp attached to records across unrelated resources.
              #
              #   @param recorded_at [Time]
              #   @param recorded_by [String]
              #   @param source [Symbol, HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Audit::Source]

              # @see HelloWorldTestingggg::Models::Placement::Logistics::Handler::Certification::Audit#source
              module Source
                extend HelloWorldTestingggg::Internal::Type::Enum

                MANUAL = :manual
                IMPORT = :import
                SYSTEM = :system

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end
      end
    end
  end
end
