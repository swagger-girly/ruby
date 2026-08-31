# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Notifications
      class PetCreatedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute pet
        #
        #   @return [HelloWorldTestingggg::Models::PetAPI]
        required :pet, -> { HelloWorldTestingggg::PetAPI }

        # @!attribute type
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Notifications::PetCreatedWebhookEvent::Type]
        required :type, enum: -> { HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type }

        # @!method initialize(pet:, type:)
        #   @param pet [HelloWorldTestingggg::Models::PetAPI]
        #   @param type [Symbol, HelloWorldTestingggg::Models::Notifications::PetCreatedWebhookEvent::Type]

        # @see HelloWorldTestingggg::Models::Notifications::PetCreatedWebhookEvent#type
        module Type
          extend HelloWorldTestingggg::Internal::Type::Enum

          PET_CREATED = :"pet.created"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
