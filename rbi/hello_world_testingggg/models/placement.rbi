# typed: strong

module HelloWorldTestingggg
  module Models
    class Placement < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Placement,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(HelloWorldTestingggg::Application) }
      attr_reader :application

      sig do
        params(application: HelloWorldTestingggg::Application::OrHash).void
      end
      attr_writer :application

      sig { returns(HelloWorldTestingggg::Placement::Status::TaggedSymbol) }
      attr_accessor :status

      # Unified activity feed mixing event, milestone, and note entries.
      sig do
        returns(
          T.nilable(
            T::Array[HelloWorldTestingggg::Placement::Activity::Variants]
          )
        )
      end
      attr_reader :activity

      sig do
        params(
          activity:
            T::Array[
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementNote::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementAdoptedMilestone::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementReturnedMilestone::OrHash
              )
            ]
        ).void
      end
      attr_writer :activity

      sig do
        returns(
          T.nilable(T::Array[HelloWorldTestingggg::PlacementEvent::Variants])
        )
      end
      attr_reader :events

      sig do
        params(
          events:
            T::Array[
              T.any(
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
              )
            ]
        ).void
      end
      attr_writer :events

      sig { returns(T.nilable(Time)) }
      attr_accessor :follow_up_after

      # Transport plan for a placement; pickup and delivery share the transfer-leg
      # shape.
      sig { returns(T.nilable(HelloWorldTestingggg::Placement::Logistics)) }
      attr_reader :logistics

      sig do
        params(
          logistics: HelloWorldTestingggg::Placement::Logistics::OrHash
        ).void
      end
      attr_writer :logistics

      sig { returns(T.nilable(HelloWorldTestingggg::MedicalSummary)) }
      attr_reader :medical_clearance

      sig do
        params(
          medical_clearance: HelloWorldTestingggg::MedicalSummary::OrHash
        ).void
      end
      attr_writer :medical_clearance

      sig { returns(Time) }
      attr_accessor :created_at

      # A post-adoption placement tracking the pet's transition to its new home.
      sig do
        params(
          id: String,
          application: HelloWorldTestingggg::Application::OrHash,
          created_at: Time,
          status: HelloWorldTestingggg::Placement::Status::OrSymbol,
          activity:
            T::Array[
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementNote::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementAdoptedMilestone::OrHash,
                HelloWorldTestingggg::Placement::Activity::PlacementReturnedMilestone::OrHash
              )
            ],
          events:
            T::Array[
              T.any(
                HelloWorldTestingggg::PlacementEvent::PlacementTransferEvent::OrHash,
                HelloWorldTestingggg::PlacementEvent::PlacementCheckupEvent::OrHash,
                HelloWorldTestingggg::PlacementEvent::PlacementDisruptionEvent::OrHash
              )
            ],
          follow_up_after: T.nilable(Time),
          logistics: HelloWorldTestingggg::Placement::Logistics::OrHash,
          medical_clearance: HelloWorldTestingggg::MedicalSummary::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        application:,
        created_at:,
        status:,
        # Unified activity feed mixing event, milestone, and note entries.
        activity: nil,
        events: nil,
        follow_up_after: nil,
        # Transport plan for a placement; pickup and delivery share the transfer-leg
        # shape.
        logistics: nil,
        medical_clearance: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            application: HelloWorldTestingggg::Application,
            created_at: Time,
            status: HelloWorldTestingggg::Placement::Status::TaggedSymbol,
            activity:
              T::Array[HelloWorldTestingggg::Placement::Activity::Variants],
            events: T::Array[HelloWorldTestingggg::PlacementEvent::Variants],
            follow_up_after: T.nilable(Time),
            logistics: HelloWorldTestingggg::Placement::Logistics,
            medical_clearance: HelloWorldTestingggg::MedicalSummary
          }
        )
      end
      def to_hash
      end

      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::Placement::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, HelloWorldTestingggg::Placement::Status::TaggedSymbol)
        ACTIVE =
          T.let(:active, HelloWorldTestingggg::Placement::Status::TaggedSymbol)
        COMPLETED =
          T.let(
            :completed,
            HelloWorldTestingggg::Placement::Status::TaggedSymbol
          )
        DISRUPTED =
          T.let(
            :disrupted,
            HelloWorldTestingggg::Placement::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Placement::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A unified placement activity-feed entry. An undiscriminated union-of-unions: two
      # branches are themselves unions (event kinds and milestones) and one is a plain
      # note.
      module Activity
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent,
              HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent,
              HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent,
              HelloWorldTestingggg::Placement::Activity::PlacementNote,
              HelloWorldTestingggg::Placement::Activity::PlacementAdoptedMilestone,
              HelloWorldTestingggg::Placement::Activity::PlacementReturnedMilestone
            )
          end

        class PlacementTransferEvent < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent,
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
              HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type::TaggedSymbol
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
                HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type::OrSymbol,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type::TaggedSymbol,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TRANSFER =
              T.let(
                :transfer,
                HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Placement::Activity::PlacementTransferEvent::Type::TaggedSymbol
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
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :occurred_at

          sig do
            returns(
              HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp
              )
            )
          end
          attr_reader :follow_up

          sig do
            params(
              follow_up:
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp::OrHash
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
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type::OrSymbol,
              follow_up:
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp::OrHash,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type::TaggedSymbol,
                follow_up:
                  HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHECKUP =
              T.let(
                :checkup,
                HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::Type::TaggedSymbol
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
                  HelloWorldTestingggg::Placement::Activity::PlacementCheckupEvent::FollowUp,
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
                HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent,
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
              HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Variants
            )
          end
          attr_accessor :severity

          sig do
            returns(
              HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type::TaggedSymbol
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
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::OrHash
                ),
              type:
                HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type::OrSymbol,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Variants,
                type:
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type::TaggedSymbol,
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
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment
                )
              end

            class Assessment < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
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
                    HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::OrSymbol,
                  reviewer: String
                ).returns(T.attached_class)
              end
              def self.new(level:, reviewer: nil)
              end

              sig do
                override.returns(
                  {
                    level:
                      HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol,
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
                      HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                LOW =
                  T.let(
                    :low,
                    HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                  )
                HIGH =
                  T.let(
                    :high,
                    HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                  )
                CRITICAL =
                  T.let(
                    :critical,
                    HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Assessment::Level::TaggedSymbol
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
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Severity::Variants
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
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DISRUPTION =
              T.let(
                :disruption,
                HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Placement::Activity::PlacementDisruptionEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class PlacementNote < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementNote,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :body

          sig { returns(Symbol) }
          attr_accessor :kind

          sig { params(body: String, kind: Symbol).returns(T.attached_class) }
          def self.new(body:, kind: :note)
          end

          sig { override.returns({ body: String, kind: Symbol }) }
          def to_hash
          end
        end

        class PlacementAdoptedMilestone < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementAdoptedMilestone,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Time) }
          attr_accessor :adopted_at

          sig { returns(Symbol) }
          attr_accessor :kind

          sig do
            params(adopted_at: Time, kind: Symbol).returns(T.attached_class)
          end
          def self.new(adopted_at:, kind: :adopted)
          end

          sig { override.returns({ adopted_at: Time, kind: Symbol }) }
          def to_hash
          end
        end

        class PlacementReturnedMilestone < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Placement::Activity::PlacementReturnedMilestone,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :kind

          sig { returns(String) }
          attr_accessor :reason

          sig { params(reason: String, kind: Symbol).returns(T.attached_class) }
          def self.new(reason:, kind: :returned)
          end

          sig { override.returns({ kind: Symbol, reason: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Placement::Activity::Variants]
          )
        end
        def self.variants
        end
      end

      class Logistics < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Placement::Logistics,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(HelloWorldTestingggg::TransferLeg)) }
        attr_reader :delivery

        sig { params(delivery: HelloWorldTestingggg::TransferLeg::OrHash).void }
        attr_writer :delivery

        sig do
          returns(
            T.nilable(HelloWorldTestingggg::Placement::Logistics::Handler)
          )
        end
        attr_reader :handler

        sig do
          params(
            handler: HelloWorldTestingggg::Placement::Logistics::Handler::OrHash
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
              HelloWorldTestingggg::Placement::Logistics::Handler::OrHash,
            pickup: HelloWorldTestingggg::TransferLeg::OrHash
          ).returns(T.attached_class)
        end
        def self.new(delivery: nil, handler: nil, pickup: nil)
        end

        sig do
          override.returns(
            {
              delivery: HelloWorldTestingggg::TransferLeg,
              handler: HelloWorldTestingggg::Placement::Logistics::Handler,
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
                HelloWorldTestingggg::Placement::Logistics::Handler,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::Placement::Logistics::Handler::Certification
              )
            )
          end
          attr_reader :certification

          sig do
            params(
              certification:
                HelloWorldTestingggg::Placement::Logistics::Handler::Certification::OrHash
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
                HelloWorldTestingggg::Placement::Logistics::Handler::Certification::OrHash,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(certification: nil, name: nil)
          end

          sig do
            override.returns(
              {
                certification:
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification,
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
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig do
              returns(
                HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol
              )
            end
            attr_accessor :level

            # Provenance stamp attached to records across unrelated resources.
            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit
                )
              )
            end
            attr_reader :audit

            sig do
              params(
                audit:
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::OrHash
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
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::OrSymbol,
                audit:
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::OrHash,
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
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol,
                  audit:
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit,
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
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              STANDARD =
                T.let(
                  :standard,
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol
                )
              ADVANCED =
                T.let(
                  :advanced,
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol
                )
              SPECIALIST =
                T.let(
                  :specialist,
                  HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Level::TaggedSymbol
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
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit,
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
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )
                )
              end
              attr_reader :source

              sig do
                params(
                  source:
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::OrSymbol
                ).void
              end
              attr_writer :source

              # Provenance stamp attached to records across unrelated resources.
              sig do
                params(
                  recorded_at: Time,
                  recorded_by: String,
                  source:
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::OrSymbol
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
                      HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
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
                      HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MANUAL =
                  T.let(
                    :manual,
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )
                IMPORT =
                  T.let(
                    :import,
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )
                SYSTEM =
                  T.let(
                    :system,
                    HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      HelloWorldTestingggg::Placement::Logistics::Handler::Certification::Audit::Source::TaggedSymbol
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
