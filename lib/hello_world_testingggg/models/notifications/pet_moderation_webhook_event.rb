# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Notifications
      module PetModerationWebhookEvent
        extend HelloWorldTestingggg::Internal::Type::Union

        discriminator :type

        variant :"pet.moderation.approved",
                -> { HelloWorldTestingggg::Notifications::PetModerationWebhookEvent::PetModerationApproved }

        variant :"pet.moderation.rejected",
                -> { HelloWorldTestingggg::Notifications::PetModerationWebhookEvent::PetModerationRejected }

        class PetModerationApproved < HelloWorldTestingggg::Internal::Type::BaseModel
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
          #   @return [Symbol, :"pet.moderation.approved"]
          required :type, const: :"pet.moderation.approved"

          # @!method initialize(approved_at:, pet:, type: :"pet.moderation.approved")
          #   @param approved_at [Time]
          #   @param pet [HelloWorldTestingggg::Models::PetAPI]
          #   @param type [Symbol, :"pet.moderation.approved"]
        end

        class PetModerationRejected < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute pet
          #
          #   @return [HelloWorldTestingggg::Models::PetAPI]
          required :pet, -> { HelloWorldTestingggg::PetAPI }

          # @!attribute reason
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::Reason]
          required :reason,
                   enum: -> { HelloWorldTestingggg::Notifications::PetModerationWebhookEvent::PetModerationRejected::Reason }

          # @!attribute type
          #
          #   @return [Symbol, :"pet.moderation.rejected"]
          required :type, const: :"pet.moderation.rejected"

          # @!attribute review_notes
          #
          #   @return [Array<HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote>, nil]
          optional :review_notes,
                   -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote] }

          # @!method initialize(pet:, reason:, review_notes: nil, type: :"pet.moderation.rejected")
          #   @param pet [HelloWorldTestingggg::Models::PetAPI]
          #   @param reason [Symbol, HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::Reason]
          #   @param review_notes [Array<HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote>]
          #   @param type [Symbol, :"pet.moderation.rejected"]

          # @see HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected#reason
          module Reason
            extend HelloWorldTestingggg::Internal::Type::Enum

            POLICY_VIOLATION = :policy_violation
            DUPLICATE = :duplicate
            UNSAFE_CONTENT = :"unsafe-content"

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
            #   @return [HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote::Reviewer, nil]
            optional :reviewer,
                     -> { HelloWorldTestingggg::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote::Reviewer }

            # @!method initialize(message:, reviewer: nil)
            #   @param message [String]
            #   @param reviewer [HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote::Reviewer]

            # @see HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected::ReviewNote#reviewer
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
        #   @return [Array(HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationApproved, HelloWorldTestingggg::Models::Notifications::PetModerationWebhookEvent::PetModerationRejected)]
      end
    end
  end
end
