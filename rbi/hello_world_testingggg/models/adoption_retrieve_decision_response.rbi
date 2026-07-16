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
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated
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

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome::TaggedSymbol
          )
        end
        attr_accessor :outcome

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :conditions

        sig { params(conditions: T::Array[String]).void }
        attr_writer :conditions

        sig do
          params(
            approved_at: Time,
            outcome:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome::OrSymbol,
            conditions: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(approved_at:, outcome:, conditions: nil)
        end

        sig do
          override.returns(
            {
              approved_at: Time,
              outcome:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome::TaggedSymbol,
              conditions: T::Array[String]
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
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPROVED =
            T.let(
              :approved,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome::TaggedSymbol
          )
        end
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
            outcome:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome::OrSymbol,
            reason:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::OrSymbol,
            appeal_deadline: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(outcome:, reason:, appeal_deadline: nil)
        end

        sig do
          override.returns(
            {
              outcome:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome::TaggedSymbol,
              reason:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason::TaggedSymbol,
              appeal_deadline: T.nilable(Time)
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
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REJECTED =
            T.let(
              :rejected,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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

        sig do
          returns(
            HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome::TaggedSymbol
          )
        end
        attr_accessor :outcome

        sig { returns(T.nilable(Time)) }
        attr_reader :review_after

        sig { params(review_after: Time).void }
        attr_writer :review_after

        sig do
          params(
            escalated_to:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::OrHash,
            outcome:
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome::OrSymbol,
            review_after: Time
          ).returns(T.attached_class)
        end
        def self.new(escalated_to:, outcome:, review_after: nil)
        end

        sig do
          override.returns(
            {
              escalated_to:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo,
              outcome:
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome::TaggedSymbol,
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

        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ESCALATED =
            T.let(
              :escalated,
              HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome::TaggedSymbol
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
