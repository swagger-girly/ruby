# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class PetInventoryLowWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute pet
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI]
      required :pet, -> { HelloWorldTestingggg::PetAPI }

      # @!attribute quantity
      #
      #   @return [Integer]
      required :quantity, Integer

      # @!attribute threshold
      #
      #   @return [Integer]
      required :threshold, Integer

      # @!attribute type
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::Type]
      required :type, enum: -> { HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type }

      # @!attribute last_order
      #
      #   @return [HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::LastOrder, nil]
      optional :last_order, -> { HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder }

      # @!attribute locations
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::Location>, nil]
      optional :locations,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location] }

      # @!method initialize(pet:, quantity:, threshold:, type:, last_order: nil, locations: nil)
      #   @param pet [HelloWorldTestingggg::Models::PetAPI]
      #   @param quantity [Integer]
      #   @param threshold [Integer]
      #   @param type [Symbol, HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::Type]
      #   @param last_order [HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::LastOrder]
      #   @param locations [Array<HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::Location>]

      # @see HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent#type
      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        PET_INVENTORY_LOW = :"pet.inventory-low"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent#last_order
      class LastOrder < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute complete
        #
        #   @return [Boolean, nil]
        optional :complete, HelloWorldTestingggg::Internal::Type::Boolean

        # @!attribute pet_id
        #
        #   @return [Integer, nil]
        optional :pet_id, Integer, api_name: :petId

        # @!attribute quantity
        #
        #   @return [Integer, nil]
        optional :quantity, Integer

        # @!attribute ship_date
        #
        #   @return [Time, nil]
        optional :ship_date, Time, api_name: :shipDate

        # @!attribute status
        #   Order Status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::LastOrder::Status, nil]
        optional :status, enum: -> { HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status }

        # @!method initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil)
        #   @param id [Integer]
        #
        #   @param complete [Boolean]
        #
        #   @param pet_id [Integer]
        #
        #   @param quantity [Integer]
        #
        #   @param ship_date [Time]
        #
        #   @param status [Symbol, HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::LastOrder::Status] Order Status

        # Order Status
        #
        # @see HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent::LastOrder#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Location < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String

        # @!attribute state
        #
        #   @return [String, nil]
        optional :state, String

        # @!attribute street
        #
        #   @return [String, nil]
        optional :street, String

        # @!attribute zip
        #
        #   @return [String, nil]
        optional :zip, String

        # @!method initialize(city: nil, state: nil, street: nil, zip: nil)
        #   @param city [String]
        #   @param state [String]
        #   @param street [String]
        #   @param zip [String]
      end
    end
  end
end
