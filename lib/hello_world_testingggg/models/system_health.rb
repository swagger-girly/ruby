# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Client#health
    class SystemHealth < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute checked_at
      #
      #   @return [Time]
      required :checked_at, Time, api_name: :checkedAt

      # @!attribute status
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::SystemHealth::Status]
      required :status, enum: -> { HelloWorldTestingggg::SystemHealth::Status }

      # @!attribute services
      #   Per-service health keyed by service name.
      #
      #   @return [Hash{Symbol=>HelloWorldTestingggg::Models::SystemHealth::Service}, nil]
      optional :services,
               -> { HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::SystemHealth::Service] }

      # @!method initialize(checked_at:, status:, services: nil)
      #   @param checked_at [Time]
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::SystemHealth::Status]
      #
      #   @param services [Hash{Symbol=>HelloWorldTestingggg::Models::SystemHealth::Service}] Per-service health keyed by service name.

      # @see HelloWorldTestingggg::Models::SystemHealth#status
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        OK = :ok
        DEGRADED = :degraded
        DOWN = :down

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Service < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::SystemHealth::Service::Status]
        required :status, enum: -> { HelloWorldTestingggg::SystemHealth::Service::Status }

        # @!attribute last_incident
        #
        #   @return [HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident, nil]
        optional :last_incident,
                 -> { HelloWorldTestingggg::SystemHealth::Service::LastIncident },
                 api_name: :lastIncident

        # @!attribute latency_ms
        #
        #   @return [Integer, nil]
        optional :latency_ms, Integer, api_name: :latencyMs

        # @!method initialize(status:, last_incident: nil, latency_ms: nil)
        #   @param status [Symbol, HelloWorldTestingggg::Models::SystemHealth::Service::Status]
        #   @param last_incident [HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident]
        #   @param latency_ms [Integer]

        # @see HelloWorldTestingggg::Models::SystemHealth::Service#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          OK = :ok
          DEGRADED = :degraded
          DOWN = :down

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::SystemHealth::Service#last_incident
        class LastIncident < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute opened_at
          #
          #   @return [Time, nil]
          optional :opened_at, Time, api_name: :openedAt

          # @!attribute resolution
          #
          #   @return [String, HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident::Resolution::IncidentReference, nil]
          optional :resolution, union: -> { HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution }

          # @!method initialize(opened_at: nil, resolution: nil)
          #   @param opened_at [Time]
          #   @param resolution [String, HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident::Resolution::IncidentReference]

          # @see HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident#resolution
          module Resolution
            extend HelloWorldTestingggg::Internal::Type::Union

            variant String

            variant -> { HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::IncidentReference }

            class IncidentReference < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute incident_id
              #
              #   @return [String]
              required :incident_id, String, api_name: :incidentId

              # @!attribute url
              #
              #   @return [String, nil]
              optional :url, String

              # @!method initialize(incident_id:, url: nil)
              #   @param incident_id [String]
              #   @param url [String]
            end

            # @!method self.variants
            #   @return [Array(String, HelloWorldTestingggg::Models::SystemHealth::Service::LastIncident::Resolution::IncidentReference)]
          end
        end
      end
    end
  end
end
