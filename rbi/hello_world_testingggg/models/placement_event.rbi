# typed: strong

module HelloWorldTestingggg
  module Models
    # A placement history entry; the shape depends on the event kind and carries no
    # discriminator mapping.
    module PlacementEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent,
            HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent,
            HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent
          )
        end

      class PlacementTransferEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(HelloWorldTestingggg::TransferLeg) }
        attr_reader :leg

        sig { params(leg: HelloWorldTestingggg::TransferLeg::OrHash).void }
        attr_writer :leg

        sig { returns(Time) }
        attr_accessor :occurred_at

        sig do
          returns(
            HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :note

        sig do
          params(
            id: String,
            leg: HelloWorldTestingggg::TransferLeg::OrHash,
            occurred_at: Time,
            type:
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type::OrSymbol,
            note: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(id:, leg:, occurred_at:, type:, note: nil)
        end

        sig do
          override.returns(
            {
              id: String,
              leg: HelloWorldTestingggg::TransferLeg,
              occurred_at: Time,
              type:
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type::OrSymbol,
              note: T.nilable(String)
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
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRANSFER =
            T.let(
              :transfer,
              HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class PlacementCheckupEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :occurred_at

        sig do
          returns(
            HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp
            )
          )
        end
        attr_reader :follow_up

        sig do
          params(
            follow_up:
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp::OrHash
          ).void
        end
        attr_writer :follow_up

        sig { returns(T.nilable(String)) }
        attr_accessor :note

        sig { returns(T.nilable(HelloWorldTestingggg::VaccinationRecord)) }
        attr_reader :record

        sig do
          params(record: HelloWorldTestingggg::VaccinationRecord::OrHash).void
        end
        attr_writer :record

        sig do
          params(
            id: String,
            occurred_at: Time,
            type:
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type::OrSymbol,
            follow_up:
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp::OrHash,
            note: T.nilable(String),
            record: HelloWorldTestingggg::VaccinationRecord::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          occurred_at:,
          type:,
          follow_up: nil,
          note: nil,
          record: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              occurred_at: Time,
              type:
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type::OrSymbol,
              follow_up:
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp,
              note: T.nilable(String),
              record: HelloWorldTestingggg::VaccinationRecord
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
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHECKUP =
            T.let(
              :checkup,
              HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class FollowUp < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::FollowUp,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Time)) }
          attr_reader :due

          sig { params(due: Time).void }
          attr_writer :due

          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          sig { params(due: Time, reason: String).returns(T.attached_class) }
          def self.new(due: nil, reason: nil)
          end

          sig { override.returns({ due: Time, reason: String }) }
          def to_hash
          end
        end
      end

      class PlacementDisruptionEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :occurred_at

        # A numeric severity score or a structured assessment.
        sig do
          returns(
            T.any(
              Integer,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment
            )
          )
        end
        attr_accessor :severity

        sig do
          returns(
            HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :note

        sig do
          params(
            id: String,
            occurred_at: Time,
            severity:
              T.any(
                Integer,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::OrHash
              ),
            type:
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type::OrSymbol,
            note: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          occurred_at:,
          # A numeric severity score or a structured assessment.
          severity:,
          type:,
          note: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              occurred_at: Time,
              severity:
                T.any(
                  Integer,
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment
                ),
              type:
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type::OrSymbol,
              note: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # A numeric severity score or a structured assessment.
        module Severity
          extend HelloWorldTestingggg::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Integer,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment
              )
            end

          class Assessment < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig do
              returns(
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::OrSymbol
              )
            end
            attr_accessor :level

            sig { returns(T.nilable(String)) }
            attr_reader :reviewer

            sig { params(reviewer: String).void }
            attr_writer :reviewer

            sig do
              params(
                level:
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::OrSymbol,
                reviewer: String
              ).returns(T.attached_class)
            end
            def self.new(level:, reviewer: nil)
            end

            sig do
              override.returns(
                {
                  level:
                    HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::OrSymbol,
                  reviewer: String
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
                    HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              LOW =
                T.let(
                  :low,
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                )
              HIGH =
                T.let(
                  :high,
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                )
              CRITICAL =
                T.let(
                  :critical,
                  HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Severity::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Type
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DISRUPTION =
            T.let(
              :disruption,
              HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[HelloWorldTestingggg::PlacementEvent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
