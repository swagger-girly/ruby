# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Adoptions#create
    class Application < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute applicant
      #
      #   @return [HelloWorldTestingggg::Models::Application::Applicant::Individual, HelloWorldTestingggg::Models::Application::Applicant::Organization]
      required :applicant, union: -> { HelloWorldTestingggg::Application::Applicant }

      # @!attribute status
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::Application::Status]
      required :status, enum: -> { HelloWorldTestingggg::Application::Status }

      # @!attribute decision
      #   The decision for an application; the shape depends on the outcome.
      #
      #   @return [HelloWorldTestingggg::Models::Application::Decision::DecisionApproved, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected, HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated, nil]
      optional :decision, union: -> { HelloWorldTestingggg::Application::Decision }

      # @!attribute fee
      #
      #   @return [HelloWorldTestingggg::Models::Money, nil]
      optional :fee, -> { HelloWorldTestingggg::Money }

      # @!attribute history
      #
      #   @return [Array<HelloWorldTestingggg::Models::Application::History>, nil]
      optional :history,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Application::History] }

      # @!attribute latest_rejection
      #
      #   @return [HelloWorldTestingggg::Models::Application::LatestRejection, nil]
      optional :latest_rejection,
               -> { HelloWorldTestingggg::Application::LatestRejection },
               api_name: :latestRejection

      # @!attribute pet
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI, nil]
      optional :pet, -> { HelloWorldTestingggg::PetAPI }

      response_only do
        # @!attribute submitted_at
        #
        #   @return [Time]
        required :submitted_at, Time, api_name: :submittedAt
      end

      # @!method initialize(id:, applicant:, status:, submitted_at:, decision: nil, fee: nil, history: nil, latest_rejection: nil, pet: nil)
      #   @param id [String]
      #
      #   @param applicant [HelloWorldTestingggg::Models::Application::Applicant::Individual, HelloWorldTestingggg::Models::Application::Applicant::Organization]
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::Application::Status]
      #
      #   @param submitted_at [Time]
      #
      #   @param decision [HelloWorldTestingggg::Models::Application::Decision::DecisionApproved, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected, HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated] The decision for an application; the shape depends on the outcome.
      #
      #   @param fee [HelloWorldTestingggg::Models::Money]
      #
      #   @param history [Array<HelloWorldTestingggg::Models::Application::History>]
      #
      #   @param latest_rejection [HelloWorldTestingggg::Models::Application::LatestRejection]
      #
      #   @param pet [HelloWorldTestingggg::Models::PetAPI]

      # @see HelloWorldTestingggg::Models::Application#applicant
      module Applicant
        extend HelloWorldTestingggg::Internal::Type::Union

        discriminator :applicant_type

        variant :individual, -> { HelloWorldTestingggg::Application::Applicant::Individual }

        variant :organization, -> { HelloWorldTestingggg::Application::Applicant::Organization }

        class Individual < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute applicant_type
          #
          #   @return [Symbol, :individual]
          required :applicant_type, const: :individual

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute address
          #
          #   @return [HelloWorldTestingggg::Models::Address, nil]
          optional :address, -> { HelloWorldTestingggg::Address }

          # @!attribute age
          #
          #   @return [Integer, nil]
          optional :age, Integer

          # @!attribute email
          #
          #   @return [String, nil]
          optional :email, String

          # @!method initialize(name:, address: nil, age: nil, email: nil, applicant_type: :individual)
          #   @param name [String]
          #   @param address [HelloWorldTestingggg::Models::Address]
          #   @param age [Integer]
          #   @param email [String]
          #   @param applicant_type [Symbol, :individual]
        end

        class Organization < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute applicant_type
          #
          #   @return [Symbol, :organization]
          required :applicant_type, const: :organization

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute shelter
          #
          #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter, nil]
          optional :shelter, -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter }

          # @!attribute tax_id
          #
          #   @return [String, nil]
          optional :tax_id, String, api_name: :taxId

          # @!method initialize(name:, shelter: nil, tax_id: nil, applicant_type: :organization)
          #   @param name [String]
          #   @param shelter [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter]
          #   @param tax_id [String]
          #   @param applicant_type [Symbol, :organization]

          # @see HelloWorldTestingggg::Models::Application::Applicant::Organization#shelter
          class Shelter < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute address
            #
            #   @return [HelloWorldTestingggg::Models::Address, nil]
            optional :address, -> { HelloWorldTestingggg::Address }

            # @!attribute contact
            #
            #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact, nil]
            optional :contact, -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact }

            # @!attribute location
            #
            #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Location, nil]
            optional :location, -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location }

            # @!method initialize(name:, address: nil, contact: nil, location: nil)
            #   @param name [String]
            #   @param address [HelloWorldTestingggg::Models::Address]
            #   @param contact [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact]
            #   @param location [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Location]

            # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter#contact
            class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute primary
              #
              #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary, nil]
              optional :primary,
                       -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary }

              # @!method initialize(primary: nil)
              #   @param primary [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary]

              # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact#primary
              class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
                # @!attribute availability
                #
                #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability, nil]
                optional :availability,
                         -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability }

                # @!attribute name
                #
                #   @return [String, nil]
                optional :name, String

                # @!attribute phone
                #
                #   @return [String, nil]
                optional :phone, String

                # @!method initialize(availability: nil, name: nil, phone: nil)
                #   @param availability [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability]
                #   @param name [String]
                #   @param phone [String]

                # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary#availability
                class Availability < HelloWorldTestingggg::Internal::Type::BaseModel
                  # @!attribute weekday
                  #
                  #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday, nil]
                  optional :weekday,
                           -> { HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday }

                  # @!attribute weekend
                  #
                  #   @return [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend, nil]
                  optional :weekend,
                           -> {
                             HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend
                           },
                           nil?: true

                  # @!method initialize(weekday: nil, weekend: nil)
                  #   @param weekday [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday]
                  #   @param weekend [HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend, nil]

                  # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability#weekday
                  class Weekday < HelloWorldTestingggg::Internal::Type::BaseModel
                    # @!attribute close
                    #
                    #   @return [String, nil]
                    optional :close, String

                    # @!attribute open_
                    #
                    #   @return [String, nil]
                    optional :open_, String, api_name: :open

                    # @!method initialize(close: nil, open_: nil)
                    #   @param close [String]
                    #   @param open_ [String]
                  end

                  # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter::Contact::Primary::Availability#weekend
                  class Weekend < HelloWorldTestingggg::Internal::Type::BaseModel
                    # @!attribute close
                    #
                    #   @return [String, nil]
                    optional :close, String

                    # @!attribute open_
                    #
                    #   @return [String, nil]
                    optional :open_, String, api_name: :open

                    # @!method initialize(close: nil, open_: nil)
                    #   @param close [String]
                    #   @param open_ [String]
                  end
                end
              end
            end

            # @see HelloWorldTestingggg::Models::Application::Applicant::Organization::Shelter#location
            class Location < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute latitude
              #
              #   @return [Float]
              required :latitude, Float

              # @!attribute longitude
              #
              #   @return [Float]
              required :longitude, Float

              # @!method initialize(latitude:, longitude:)
              #   @param latitude [Float]
              #   @param longitude [Float]
            end
          end
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::Application::Applicant::Individual, HelloWorldTestingggg::Models::Application::Applicant::Organization)]
      end

      # @see HelloWorldTestingggg::Models::Application#status
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        RECEIVED = :received
        UNDER_REVIEW = :under_review
        APPROVED = :approved
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The decision for an application; the shape depends on the outcome.
      #
      # @see HelloWorldTestingggg::Models::Application#decision
      module Decision
        extend HelloWorldTestingggg::Internal::Type::Union

        variant -> { HelloWorldTestingggg::Application::Decision::DecisionApproved }

        variant -> { HelloWorldTestingggg::Application::Decision::DecisionRejected }

        variant -> { HelloWorldTestingggg::Application::Decision::DecisionEscalated }

        class DecisionApproved < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute approved_at
          #
          #   @return [Time]
          required :approved_at, Time, api_name: :approvedAt

          # @!attribute outcome
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionApproved::Outcome]
          required :outcome, enum: -> { HelloWorldTestingggg::Application::Decision::DecisionApproved::Outcome }

          # @!attribute conditions
          #
          #   @return [Array<String>, nil]
          optional :conditions, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

          # @!method initialize(approved_at:, outcome:, conditions: nil)
          #   @param approved_at [Time]
          #   @param outcome [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionApproved::Outcome]
          #   @param conditions [Array<String>]

          # @see HelloWorldTestingggg::Models::Application::Decision::DecisionApproved#outcome
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
          #   @return [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected::Outcome]
          required :outcome, enum: -> { HelloWorldTestingggg::Application::Decision::DecisionRejected::Outcome }

          # @!attribute reason
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected::Reason]
          required :reason, enum: -> { HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason }

          # @!attribute appeal_deadline
          #
          #   @return [Time, nil]
          optional :appeal_deadline, Time, api_name: :appealDeadline, nil?: true

          # @!method initialize(outcome:, reason:, appeal_deadline: nil)
          #   @param outcome [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected::Outcome]
          #   @param reason [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected::Reason]
          #   @param appeal_deadline [Time, nil]

          # @see HelloWorldTestingggg::Models::Application::Decision::DecisionRejected#outcome
          module Outcome
            extend HelloWorldTestingggg::Internal::Type::Enum

            REJECTED = :rejected

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see HelloWorldTestingggg::Models::Application::Decision::DecisionRejected#reason
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
          #   @return [HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::EscalatedTo]
          required :escalated_to,
                   -> { HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo },
                   api_name: :escalatedTo

          # @!attribute outcome
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::Outcome]
          required :outcome, enum: -> { HelloWorldTestingggg::Application::Decision::DecisionEscalated::Outcome }

          # @!attribute review_after
          #
          #   @return [Time, nil]
          optional :review_after, Time, api_name: :reviewAfter

          # @!method initialize(escalated_to:, outcome:, review_after: nil)
          #   @param escalated_to [HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::EscalatedTo]
          #   @param outcome [Symbol, HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::Outcome]
          #   @param review_after [Time]

          # @see HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated#escalated_to
          class EscalatedTo < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute team
            #
            #   @return [String]
            required :team, String

            # @!attribute contact
            #
            #   @return [HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::EscalatedTo::Contact, nil]
            optional :contact,
                     -> { HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact }

            # @!method initialize(team:, contact: nil)
            #   @param team [String]
            #   @param contact [HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::EscalatedTo::Contact]

            # @see HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated::EscalatedTo#contact
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

          # @see HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated#outcome
          module Outcome
            extend HelloWorldTestingggg::Internal::Type::Enum

            ESCALATED = :escalated

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::Application::Decision::DecisionApproved, HelloWorldTestingggg::Models::Application::Decision::DecisionRejected, HelloWorldTestingggg::Models::Application::Decision::DecisionEscalated)]
      end

      class History < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute changed_at
        #
        #   @return [Time]
        required :changed_at, Time, api_name: :changedAt

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Application::History::Status]
        required :status, enum: -> { HelloWorldTestingggg::Application::History::Status }

        # @!attribute note
        #
        #   @return [String, nil]
        optional :note, String, nil?: true

        # @!method initialize(changed_at:, status:, note: nil)
        #   @param changed_at [Time]
        #   @param status [Symbol, HelloWorldTestingggg::Models::Application::History::Status]
        #   @param note [String, nil]

        # @see HelloWorldTestingggg::Models::Application::History#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          RECEIVED = :received
          UNDER_REVIEW = :under_review
          APPROVED = :approved
          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see HelloWorldTestingggg::Models::Application#latest_rejection
      class LatestRejection < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute outcome
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Application::LatestRejection::Outcome]
        required :outcome, enum: -> { HelloWorldTestingggg::Application::LatestRejection::Outcome }

        # @!attribute reason
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Application::LatestRejection::Reason]
        required :reason, enum: -> { HelloWorldTestingggg::Application::LatestRejection::Reason }

        # @!attribute appeal_deadline
        #
        #   @return [Time, nil]
        optional :appeal_deadline, Time, api_name: :appealDeadline, nil?: true

        # @!method initialize(outcome:, reason:, appeal_deadline: nil)
        #   @param outcome [Symbol, HelloWorldTestingggg::Models::Application::LatestRejection::Outcome]
        #   @param reason [Symbol, HelloWorldTestingggg::Models::Application::LatestRejection::Reason]
        #   @param appeal_deadline [Time, nil]

        # @see HelloWorldTestingggg::Models::Application::LatestRejection#outcome
        module Outcome
          extend HelloWorldTestingggg::Internal::Type::Enum

          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::Application::LatestRejection#reason
        module Reason
          extend HelloWorldTestingggg::Internal::Type::Enum

          POLICY = :policy
          CAPACITY = :capacity
          INCOMPLETE = :incomplete

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
