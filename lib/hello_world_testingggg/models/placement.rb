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

      # @!method initialize(id:, application:, created_at:, status:, events: nil, follow_up_after: nil, logistics: nil, medical_clearance: nil)
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
