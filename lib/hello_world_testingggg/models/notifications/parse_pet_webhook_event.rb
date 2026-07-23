# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Notifications
      module ParsePetWebhookEvent
        extend HelloWorldTestingggg::Internal::Type::Union

        variant -> { HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent }

        variant -> { HelloWorldTestingggg::Notifications::PetUpdatedWebhookEvent }

        variant -> { HelloWorldTestingggg::Notifications::PetInventoryLowWebhookEvent }

        variant -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent }

        variant -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent }

        class PetModerationApprovedEvent < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute approved_at
          #
          #   @return [Time]
          required :approved_at, Time

          # @!attribute pet
          #
          #   @return [HelloWorldTestingggg::Models::PetAPI]
          required :pet, -> { HelloWorldTestingggg::PetAPI }

          # @!attribute type
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type]
          required :type,
                   enum: -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type }

          # @!method initialize(approved_at:, pet:, type:)
          #   @param approved_at [Time]
          #   @param pet [HelloWorldTestingggg::Models::PetAPI]
          #   @param type [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type]

          # @see HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent#type
          module Type
            extend HelloWorldTestingggg::Internal::Type::Enum

            PET_MODERATION_APPROVED = :"pet.moderation.approved"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class PetModerationRejectedEvent < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute pet
          #
          #   @return [HelloWorldTestingggg::Models::PetAPI]
          required :pet, -> { HelloWorldTestingggg::PetAPI }

          # @!attribute reason
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason]
          required :reason,
                   enum: -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason }

          # @!attribute type
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type]
          required :type,
                   enum: -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type }

          # @!attribute review_notes
          #
          #   @return [Array<HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote>, nil]
          optional :review_notes,
                   -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote] }

          # @!method initialize(pet:, reason:, type:, review_notes: nil)
          #   @param pet [HelloWorldTestingggg::Models::PetAPI]
          #   @param reason [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason]
          #   @param type [Symbol, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type]
          #   @param review_notes [Array<HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote>]

          # @see HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent#reason
          module Reason
            extend HelloWorldTestingggg::Internal::Type::Enum

            POLICY_VIOLATION = :policy_violation
            DUPLICATE = :duplicate
            UNSAFE_CONTENT = :"unsafe-content"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent#type
          module Type
            extend HelloWorldTestingggg::Internal::Type::Enum

            PET_MODERATION_REJECTED = :"pet.moderation.rejected"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class ReviewNote < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute message
            #
            #   @return [String]
            required :message, String

            # @!attribute reviewer
            #
            #   @return [HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer, nil]
            optional :reviewer,
                     -> { HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer }

            # @!method initialize(message:, reviewer: nil)
            #   @param message [String]
            #   @param reviewer [HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer]

            # @see HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote#reviewer
            class Reviewer < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [Integer, nil]
              optional :id, Integer

              # @!attribute email
              #
              #   @return [String, nil]
              optional :email, String

              # @!attribute first_name
              #
              #   @return [String, nil]
              optional :first_name, String, api_name: :firstName

              # @!attribute last_name
              #
              #   @return [String, nil]
              optional :last_name, String, api_name: :lastName

              # @!attribute password
              #
              #   @return [String, nil]
              optional :password, String

              # @!attribute phone
              #
              #   @return [String, nil]
              optional :phone, String

              # @!attribute username
              #
              #   @return [String, nil]
              optional :username, String

              # @!attribute user_status
              #   User Status
              #
              #   @return [Integer, nil]
              optional :user_status, Integer, api_name: :userStatus

              # @!method initialize(id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, username: nil, user_status: nil)
              #   @param id [Integer]
              #
              #   @param email [String]
              #
              #   @param first_name [String]
              #
              #   @param last_name [String]
              #
              #   @param password [String]
              #
              #   @param phone [String]
              #
              #   @param username [String]
              #
              #   @param user_status [Integer] User Status
            end
          end
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::Notifications::PetCreatedWebhookEvent, HelloWorldTestingggg::Models::Notifications::PetUpdatedWebhookEvent, HelloWorldTestingggg::Models::Notifications::PetInventoryLowWebhookEvent, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent)]
      end
    end
  end
end
