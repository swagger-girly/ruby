# typed: strong

module HelloWorldTestingggg
  module Models
    # The decision for an application; the shape depends on the outcome.
    module AdoptionRetrieveDecisionResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved,
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected,
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated,
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn
          )
        end

      class DecisionApproved < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :approved_at

        sig { returns(Symbol) }
        attr_accessor :outcome

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :conditions

        sig { params(conditions: T::Array[String]).void }
        attr_writer :conditions

        sig do
          params(
            approved_at: Time,
            conditions: T::Array[String],
            outcome: Symbol
          ).returns(T.attached_class)
        end
        def self.new(approved_at:, conditions: nil, outcome: :approved)
        end

        sig do
          override.returns(
            { approved_at: Time, outcome: Symbol, conditions: T::Array[String] }
          )
        end
        def to_hash
        end
      end

      class DecisionRejected < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :outcome

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        sig { returns(T.nilable(Time)) }
        attr_accessor :appeal_deadline

        sig do
          params(
            reason:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::OrSymbol,
            appeal_deadline: T.nilable(Time),
            outcome: Symbol
          ).returns(T.attached_class)
        end
        def self.new(reason:, appeal_deadline: nil, outcome: :rejected)
        end

        sig do
          override.returns(
            {
              outcome: Symbol,
              reason:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol,
              appeal_deadline: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        module Reason
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          POLICY =
            T.let(
              :policy,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol
            )
          CAPACITY =
            T.let(
              :capacity,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol
            )
          INCOMPLETE =
            T.let(
              :incomplete,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DecisionEscalated < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo
          )
        end
        attr_reader :escalated_to

        sig do
          params(
            escalated_to:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::OrHash
          ).void
        end
        attr_writer :escalated_to

        sig { returns(Symbol) }
        attr_accessor :outcome

        sig { returns(T.nilable(Time)) }
        attr_reader :review_after

        sig { params(review_after: Time).void }
        attr_writer :review_after

        sig do
          params(
            escalated_to:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::OrHash,
            review_after: Time,
            outcome: Symbol
          ).returns(T.attached_class)
        end
        def self.new(escalated_to:, review_after: nil, outcome: :escalated)
        end

        sig do
          override.returns(
            {
              escalated_to:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo,
              outcome: Symbol,
              review_after: Time
            }
          )
        end
        def to_hash
        end

        class EscalatedTo < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :team

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact
              )
            )
          end
          attr_reader :contact

          sig do
            params(
              contact:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact::OrHash
            ).void
          end
          attr_writer :contact

          sig do
            params(
              team: String,
              contact:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact::OrHash
            ).returns(T.attached_class)
          end
          def self.new(team:, contact: nil)
          end

          sig do
            override.returns(
              {
                team: String,
                contact:
                  HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact
              }
            )
          end
          def to_hash
          end

          class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :email

            sig { params(email: String).void }
            attr_writer :email

            sig { returns(T.nilable(String)) }
            attr_reader :hours

            sig { params(hours: String).void }
            attr_writer :hours

            sig do
              params(email: String, hours: String).returns(T.attached_class)
            end
            def self.new(email: nil, hours: nil)
            end

            sig { override.returns({ email: String, hours: String }) }
            def to_hash
            end
          end
        end
      end

      class DecisionWithdrawn < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::TaggedSymbol
          )
        end
        attr_accessor :outcome

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
          )
        end
        attr_accessor :withdrawn_by

        sig { returns(T.nilable(Time)) }
        attr_reader :withdrawn_at

        sig { params(withdrawn_at: Time).void }
        attr_writer :withdrawn_at

        # The applicant or shelter withdrew before a decision was finalized.
        sig do
          params(
            outcome:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::OrSymbol,
            withdrawn_by:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::OrSymbol,
            withdrawn_at: Time
          ).returns(T.attached_class)
        end
        def self.new(outcome:, withdrawn_by:, withdrawn_at: nil)
        end

        sig do
          override.returns(
            {
              outcome:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::TaggedSymbol,
              withdrawn_by:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol,
              withdrawn_at: Time
            }
          )
        end
        def to_hash
        end

        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WITHDRAWN =
            T.let(
              :withdrawn,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module WithdrawnBy
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPLICANT =
            T.let(
              :applicant,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
            )
          SHELTER =
            T.let(
              :shelter,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
            )
          SYSTEM =
            T.let(
              :system,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
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
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
