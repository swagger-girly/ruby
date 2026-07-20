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

      # The applicant or shelter withdrew before a decision was finalized.
      variant -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn }

      class DecisionApproved < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute approved_at
        #
        #   @return [Time]
        required :approved_at, Time, api_name: :approvedAt

        # @!attribute outcome
        #
        #   @return [Symbol, :approved]
        required :outcome, const: :approved

        # @!attribute conditions
        #
        #   @return [Array<String>, nil]
        optional :conditions, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

        # @!method initialize(approved_at:, conditions: nil, outcome: :approved)
        #   @param approved_at [Time]
        #   @param conditions [Array<String>]
        #   @param outcome [Symbol, :approved]
      end

      class DecisionRejected < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute outcome
        #
        #   @return [Symbol, :rejected]
        required :outcome, const: :rejected

        # @!attribute reason
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason]
        required :reason,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason }

        # @!attribute appeal_deadline
        #
        #   @return [Time, nil]
        optional :appeal_deadline, Time, api_name: :appealDeadline, nil?: true

        # @!method initialize(reason:, appeal_deadline: nil, outcome: :rejected)
        #   @param reason [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected::Reason]
        #   @param appeal_deadline [Time, nil]
        #   @param outcome [Symbol, :rejected]

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
        #   @return [Symbol, :escalated]
        required :outcome, const: :escalated

        # @!attribute review_after
        #
        #   @return [Time, nil]
        optional :review_after, Time, api_name: :reviewAfter

        # @!method initialize(escalated_to:, review_after: nil, outcome: :escalated)
        #   @param escalated_to [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated::EscalatedTo]
        #   @param review_after [Time]
        #   @param outcome [Symbol, :escalated]

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
      end

      class DecisionWithdrawn < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute outcome
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome]
        required :outcome,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome }

        # @!attribute withdrawn_by
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy]
        required :withdrawn_by,
                 enum: -> { HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy },
                 api_name: :withdrawnBy

        # @!attribute withdrawn_at
        #
        #   @return [Time, nil]
        optional :withdrawn_at, Time, api_name: :withdrawnAt

        # @!method initialize(outcome:, withdrawn_by:, withdrawn_at: nil)
        #   The applicant or shelter withdrew before a decision was finalized.
        #
        #   @param outcome [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::Outcome]
        #   @param withdrawn_by [Symbol, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn::WithdrawnBy]
        #   @param withdrawn_at [Time]

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn#outcome
        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          WITHDRAWN = :withdrawn
          EXPIRED = :expired

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn#withdrawn_by
        module WithdrawnBy
          extend HelloWorldTestingggg::Internal::Type::Enum

          APPLICANT = :applicant
          SHELTER = :shelter
          SYSTEM = :system

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionWithdrawn)]
    end
  end
end
