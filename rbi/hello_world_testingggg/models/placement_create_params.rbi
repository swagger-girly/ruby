# typed: strong

module HelloWorldTestingggg
  module Models
    class PlacementCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PlacementCreateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :application_id

      # A placement history entry; the shape depends on the event kind and carries no
      # discriminator mapping.
      sig do
        returns(
          T.nilable(
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent
            )
          )
        )
      end
      attr_reader :initial_event

      sig do
        params(
          initial_event:
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
            )
        ).void
      end
      attr_writer :initial_event

      # Transport plan for a placement; pickup and delivery share the transfer-leg
      # shape.
      sig do
        returns(
          T.nilable(HelloWorldTestingggg::PlacementCreateParams::Logistics)
        )
      end
      attr_reader :logistics

      sig do
        params(
          logistics:
            HelloWorldTestingggg::PlacementCreateParams::Logistics::OrHash
        ).void
      end
      attr_writer :logistics

      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_for

      sig { params(scheduled_for: Time).void }
      attr_writer :scheduled_for

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            application_id: String,
            initial_event:
              T.any(
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent,
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent
              ),
            logistics: HelloWorldTestingggg::PlacementCreateParams::Logistics,
            scheduled_for: Time,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Logistics < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PlacementCreateParams::Logistics,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(HelloWorldTestingggg::TransferLeg)) }
        attr_reader :delivery

        sig { params(delivery: HelloWorldTestingggg::TransferLeg::OrHash).void }
        attr_writer :delivery

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler
            )
          )
        end
        attr_reader :handler

        sig do
          params(
            handler:
              HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::OrHash
          ).void
        end
        attr_writer :handler

        sig { returns(T.nilable(HelloWorldTestingggg::TransferLeg)) }
        attr_reader :pickup

        sig { params(pickup: HelloWorldTestingggg::TransferLeg::OrHash).void }
        attr_writer :pickup

        # Transport plan for a placement; pickup and delivery share the transfer-leg
        # shape.
        sig do
          params(
            delivery: HelloWorldTestingggg::TransferLeg::OrHash,
            handler:
              HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::OrHash,
            pickup: HelloWorldTestingggg::TransferLeg::OrHash
          ).returns(T.attached_class)
        end
        def self.new(delivery: nil, handler: nil, pickup: nil)
        end

        sig do
          override.returns(
            {
              delivery: HelloWorldTestingggg::TransferLeg,
              handler:
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler,
              pickup: HelloWorldTestingggg::TransferLeg
            }
          )
        end
        def to_hash
        end

        class Handler < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification
              )
            )
          end
          attr_reader :certification

          sig do
            params(
              certification:
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::OrHash
            ).void
          end
          attr_writer :certification

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(
              certification:
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::OrHash,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(certification: nil, name: nil)
          end

          sig do
            override.returns(
              {
                certification:
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification,
                name: String
              }
            )
          end
          def to_hash
          end

          class Certification < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig do
              returns(
                HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::OrSymbol
              )
            end
            attr_accessor :level

            # Provenance stamp attached to records across unrelated resources.
            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit
                )
              )
            end
            attr_reader :audit

            sig do
              params(
                audit:
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::OrHash
              ).void
            end
            attr_writer :audit

            sig { returns(T.nilable(String)) }
            attr_reader :issued_by

            sig { params(issued_by: String).void }
            attr_writer :issued_by

            sig do
              params(
                level:
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::OrSymbol,
                audit:
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::OrHash,
                issued_by: String
              ).returns(T.attached_class)
            end
            def self.new(
              level:,
              # Provenance stamp attached to records across unrelated resources.
              audit: nil,
              issued_by: nil
            )
            end

            sig do
              override.returns(
                {
                  level:
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::OrSymbol,
                  audit:
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit,
                  issued_by: String
                }
              )
            end
            def to_hash
            end

            module Level
              extend HelloWorldTestingggg::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              STANDARD =
                T.let(
                  :standard,
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::TaggedSymbol
                )
              ADVANCED =
                T.let(
                  :advanced,
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::TaggedSymbol
                )
              SPECIALIST =
                T.let(
                  :specialist,
                  HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Level::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Audit < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig { returns(Time) }
              attr_accessor :recorded_at

              sig { returns(T.nilable(String)) }
              attr_reader :recorded_by

              sig { params(recorded_by: String).void }
              attr_writer :recorded_by

              sig do
                returns(
                  T.nilable(
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::OrSymbol
                  )
                )
              end
              attr_reader :source

              sig do
                params(
                  source:
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::OrSymbol
                ).void
              end
              attr_writer :source

              # Provenance stamp attached to records across unrelated resources.
              sig do
                params(
                  recorded_at: Time,
                  recorded_by: String,
                  source:
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(recorded_at:, recorded_by: nil, source: nil)
              end

              sig do
                override.returns(
                  {
                    recorded_at: Time,
                    recorded_by: String,
                    source:
                      HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::OrSymbol
                  }
                )
              end
              def to_hash
              end

              module Source
                extend HelloWorldTestingggg::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MANUAL =
                  T.let(
                    :manual,
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )
                IMPORT =
                  T.let(
                    :import,
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )
                SYSTEM =
                  T.let(
                    :system,
                    HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      HelloWorldTestingggg::PlacementCreateParams::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end
      end
    end
  end
end
