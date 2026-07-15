# typed: strong

module HelloWorldTestingggg
  module Models
    class SystemHealth < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::SystemHealth,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Time) }
      attr_accessor :checked_at

      sig { returns(HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol) }
      attr_accessor :status

      # Per-service health keyed by service name.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, HelloWorldTestingggg::SystemHealth::Service]
          )
        )
      end
      attr_reader :services

      sig do
        params(
          services:
            T::Hash[Symbol, HelloWorldTestingggg::SystemHealth::Service::OrHash]
        ).void
      end
      attr_writer :services

      sig do
        params(
          checked_at: Time,
          status: HelloWorldTestingggg::SystemHealth::Status::OrSymbol,
          services:
            T::Hash[Symbol, HelloWorldTestingggg::SystemHealth::Service::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        checked_at:,
        status:,
        # Per-service health keyed by service name.
        services: nil
      )
      end

      sig do
        override.returns(
          {
            checked_at: Time,
            status: HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol,
            services:
              T::Hash[Symbol, HelloWorldTestingggg::SystemHealth::Service]
          }
        )
      end
      def to_hash
      end

      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::SystemHealth::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK =
          T.let(:ok, HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol)
        DEGRADED =
          T.let(
            :degraded,
            HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol
          )
        DOWN =
          T.let(:down, HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::SystemHealth::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Service < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::SystemHealth::Service,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            T.nilable(HelloWorldTestingggg::SystemHealth::Service::LastIncident)
          )
        end
        attr_reader :last_incident

        sig do
          params(
            last_incident:
              HelloWorldTestingggg::SystemHealth::Service::LastIncident::OrHash
          ).void
        end
        attr_writer :last_incident

        sig { returns(T.nilable(Integer)) }
        attr_reader :latency_ms

        sig { params(latency_ms: Integer).void }
        attr_writer :latency_ms

        sig do
          params(
            status:
              HelloWorldTestingggg::SystemHealth::Service::Status::OrSymbol,
            last_incident:
              HelloWorldTestingggg::SystemHealth::Service::LastIncident::OrHash,
            latency_ms: Integer
          ).returns(T.attached_class)
        end
        def self.new(status:, last_incident: nil, latency_ms: nil)
        end

        sig do
          override.returns(
            {
              status:
                HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol,
              last_incident:
                HelloWorldTestingggg::SystemHealth::Service::LastIncident,
              latency_ms: Integer
            }
          )
        end
        def to_hash
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, HelloWorldTestingggg::SystemHealth::Service::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OK =
            T.let(
              :ok,
              HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol
            )
          DEGRADED =
            T.let(
              :degraded,
              HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol
            )
          DOWN =
            T.let(
              :down,
              HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::SystemHealth::Service::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class LastIncident < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::SystemHealth::Service::LastIncident,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Time)) }
          attr_reader :opened_at

          sig { params(opened_at: Time).void }
          attr_writer :opened_at

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::Variants
              )
            )
          end
          attr_reader :resolution

          sig do
            params(
              resolution:
                T.any(
                  String,
                  HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::IncidentReference::OrHash
                )
            ).void
          end
          attr_writer :resolution

          sig do
            params(
              opened_at: Time,
              resolution:
                T.any(
                  String,
                  HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::IncidentReference::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(opened_at: nil, resolution: nil)
          end

          sig do
            override.returns(
              {
                opened_at: Time,
                resolution:
                  HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::Variants
              }
            )
          end
          def to_hash
          end

          module Resolution
            extend HelloWorldTestingggg::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::IncidentReference
                )
              end

            class IncidentReference < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::IncidentReference,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :incident_id

              sig { returns(T.nilable(String)) }
              attr_reader :url

              sig { params(url: String).void }
              attr_writer :url

              sig do
                params(incident_id: String, url: String).returns(
                  T.attached_class
                )
              end
              def self.new(incident_id:, url: nil)
              end

              sig { override.returns({ incident_id: String, url: String }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::SystemHealth::Service::LastIncident::Resolution::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end
      end
    end
  end
end
