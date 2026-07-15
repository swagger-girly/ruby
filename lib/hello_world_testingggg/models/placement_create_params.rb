# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Placements#create
    class PlacementCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute application_id
      #
      #   @return [String]
      required :application_id, String, api_name: :applicationId

      # @!attribute initial_event
      #   A placement history entry; the shape depends on the event kind and carries no
      #   discriminator mapping.
      #
      #   @return [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent, nil]
      optional :initial_event, union: -> { HelloWorldTestingggg::PlacementEvent }, api_name: :initialEvent

      # @!attribute logistics
      #   Transport plan for a placement; pickup and delivery share the transfer-leg
      #   shape.
      #
      #   @return [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics, nil]
      optional :logistics, -> { HelloWorldTestingggg::PlacementCreateParams::Logistics }

      # @!attribute scheduled_for
      #
      #   @return [Time, nil]
      optional :scheduled_for, Time, api_name: :scheduledFor

      # @!method initialize(application_id:, initial_event: nil, logistics: nil, scheduled_for: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {HelloWorldTestingggg::Models::PlacementCreateParams} for more details.
      #
      #   @param application_id [String]
      #
      #   @param initial_event [HelloWorldTestingggg::Models::PlacementEvent::PlacementTransferEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementCheckupEvent, HelloWorldTestingggg::Models::PlacementEvent::PlacementDisruptionEvent] A placement history entry; the shape depends on the event kind and carries no di
      #
      #   @param logistics [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics] Transport plan for a placement; pickup and delivery share the transfer-leg shape
      #
      #   @param scheduled_for [Time]
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      class Logistics < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute delivery
        #
        #   @return [HelloWorldTestingggg::Models::TransferLeg, nil]
        optional :delivery, -> { HelloWorldTestingggg::TransferLeg }

        # @!attribute handler
        #
        #   @return [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler, nil]
        optional :handler, -> { HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler }

        # @!attribute pickup
        #
        #   @return [HelloWorldTestingggg::Models::TransferLeg, nil]
        optional :pickup, -> { HelloWorldTestingggg::TransferLeg }

        # @!method initialize(delivery: nil, handler: nil, pickup: nil)
        #   Transport plan for a placement; pickup and delivery share the transfer-leg
        #   shape.
        #
        #   @param delivery [HelloWorldTestingggg::Models::TransferLeg]
        #   @param handler [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler]
        #   @param pickup [HelloWorldTestingggg::Models::TransferLeg]

        # @see HelloWorldTestingggg::Models::PlacementCreateParams::Logistics#handler
        class Handler < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute certification
          #
          #   @return [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification, nil]
          optional :certification,
                   -> { HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification }

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(certification: nil, name: nil)
          #   @param certification [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification]
          #   @param name [String]

          # @see HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler#certification
          class Certification < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute level
            #
            #   @return [Symbol, HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Level]
            required :level,
                     enum: -> { HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level }

            # @!attribute audit
            #   Provenance stamp attached to records across unrelated resources.
            #
            #   @return [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Audit, nil]
            optional :audit,
                     -> { HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit }

            # @!attribute issued_by
            #
            #   @return [String, nil]
            optional :issued_by, String, api_name: :issuedBy

            # @!method initialize(level:, audit: nil, issued_by: nil)
            #   @param level [Symbol, HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Level]
            #
            #   @param audit [HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Audit] Provenance stamp attached to records across unrelated resources.
            #
            #   @param issued_by [String]

            # @see HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification#level
            module Level
              extend HelloWorldTestingggg::Internal::Type::Enum

              STANDARD = :standard
              ADVANCED = :advanced
              SPECIALIST = :specialist

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification#audit
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
              #   @return [Symbol, HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source, nil]
              optional :source,
                       enum: -> { HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source }

              # @!method initialize(recorded_at:, recorded_by: nil, source: nil)
              #   Provenance stamp attached to records across unrelated resources.
              #
              #   @param recorded_at [Time]
              #   @param recorded_by [String]
              #   @param source [Symbol, HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source]

              # @see HelloWorldTestingggg::Models::PlacementCreateParams::Logistics::Handler::Certification::Audit#source
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
