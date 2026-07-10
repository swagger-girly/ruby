# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class PetUpdatedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute changed_fields
      #
      #   @return [Array<Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::ChangedField>]
      required :changed_fields,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[enum: HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField] }

      # @!attribute pet
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI]
      required :pet, -> { HelloWorldTestingggg::PetAPI }

      # @!attribute type
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::Type]
      required :type, enum: -> { HelloWorldTestingggg::PetUpdatedWebhookEvent::Type }

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, HelloWorldTestingggg::Internal::Type::HashOf[String]

      # @!attribute previous_status
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::PreviousStatus, nil]
      optional :previous_status,
               enum: -> { HelloWorldTestingggg::PetUpdatedWebhookEvent::PreviousStatus },
               nil?: true

      # @!method initialize(changed_fields:, pet:, type:, metadata: nil, previous_status: nil)
      #   @param changed_fields [Array<Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::ChangedField>]
      #   @param pet [HelloWorldTestingggg::Models::PetAPI]
      #   @param type [Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::Type]
      #   @param metadata [Hash{Symbol=>String}]
      #   @param previous_status [Symbol, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent::PreviousStatus, nil]

      module ChangedField
        extend HelloWorldTestingggg::Internal::Type::Enum

        NAME = :name
        STATUS = :status
        CATEGORY = :category
        TAGS = :tags

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see HelloWorldTestingggg::Models::PetUpdatedWebhookEvent#type
      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        PET_UPDATED = :"pet.updated"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see HelloWorldTestingggg::Models::PetUpdatedWebhookEvent#previous_status
      module PreviousStatus
        extend HelloWorldTestingggg::Internal::Type::Enum

        AVAILABLE = :available
        PENDING = :pending
        SOLD = :sold

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
