# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # The decision for an application; the shape depends on the outcome.
    #
    # @see HelloWorldTestingggg::Resources::Adoptions#retrieve_decision
    module AdoptionRetrieveDecisionResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      variant -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved }

      variant -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected }

      variant -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated }

      class DecisionApproved < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute approved_at
        #
        #   @return [Time]
        required :approved_at, Time, api_name: :approvedAt

        # @!attribute outcome
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome]
        required :outcome,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome }

        # @!attribute conditions
        #
        #   @return [Array<String>, nil]
        optional :conditions, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

        # @!method initialize(approved_at:, outcome:, conditions: nil)
        #   @param approved_at [Time]
        #   @param outcome [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved::Outcome]
        #   @param conditions [Array<String>]

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved#outcome
        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          APPROVED = :approved

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class DecisionRejected < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute outcome
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome]
        required :outcome,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome }

        # @!attribute reason
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason]
        required :reason,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason }

        # @!attribute appeal_deadline
        #
        #   @return [Time, nil]
        optional :appeal_deadline, Time, api_name: :appealDeadline, nil?: true

        # @!method initialize(outcome:, reason:, appeal_deadline: nil)
        #   @param outcome [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Outcome]
        #   @param reason [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason]
        #   @param appeal_deadline [Time, nil]

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected#outcome
        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected#reason
        module Reason
          extend HelloWorldTestingggg::Internal::Type::Enum

          POLICY = :policy
          CAPACITY = :capacity
          INCOMPLETE = :incomplete

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class DecisionEscalated < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute escalated_to
        #
        #   @return [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo]
        required :escalated_to,
                 -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo },
                 api_name: :escalatedTo

        # @!attribute outcome
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome]
        required :outcome,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome }

        # @!attribute review_after
        #
        #   @return [Time, nil]
        optional :review_after, Time, api_name: :reviewAfter

        # @!method initialize(escalated_to:, outcome:, review_after: nil)
        #   @param escalated_to [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo]
        #   @param outcome [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::Outcome]
        #   @param review_after [Time]

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated#escalated_to
        class EscalatedTo < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute team
          #
          #   @return [String]
          required :team, String

          # @!attribute contact
          #
          #   @return [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact, nil]
          optional :contact,
                   -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact }

          # @!method initialize(team:, contact: nil)
          #   @param team [String]
          #   @param contact [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo::Contact]

          # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo#contact
          class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute email
            #
            #   @return [String, nil]
            optional :email, String

            # @!attribute hours
            #
            #   @return [String, nil]
            optional :hours, String

            # @!method initialize(email: nil, hours: nil)
            #   @param email [String]
            #   @param hours [String]
          end
        end

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated#outcome
        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          ESCALATED = :escalated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated)]
    end
  end
end
