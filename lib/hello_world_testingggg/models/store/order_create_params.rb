# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Order#create
      class OrderCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

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

        # @!attribute related_address
        #
        #   @return [HelloWorldTestingggg::Models::Address, nil]
        optional :related_address, -> { HelloWorldTestingggg::Address }, api_name: :relatedAddress

        # @!attribute related_category
        #
        #   @return [Object, nil]
        optional :related_category, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedCategory

        # @!attribute related_customer
        #
        #   @return [Object, nil]
        optional :related_customer, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedCustomer

        # @!attribute related_money
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :related_money, -> { HelloWorldTestingggg::Money }, api_name: :relatedMoney

        # @!attribute related_pet
        #
        #   @return [HelloWorldTestingggg::Models::PetAPI, nil]
        optional :related_pet, -> { HelloWorldTestingggg::PetAPI }, api_name: :relatedPet

        # @!attribute related_shelter
        #
        #   @return [Object, nil]
        optional :related_shelter, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedShelter

        # @!attribute related_tag
        #
        #   @return [Object, nil]
        optional :related_tag, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedTag

        # @!attribute related_user
        #
        #   @return [Object, nil]
        optional :related_user, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedUser

        # @!attribute ship_date
        #
        #   @return [Time, nil]
        optional :ship_date, Time, api_name: :shipDate

        # @!attribute status
        #   Order Status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateParams::Status, nil]
        optional :status, enum: -> { HelloWorldTestingggg::Store::OrderCreateParams::Status }

        # @!attribute total
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :total, -> { HelloWorldTestingggg::Money }

        # @!method initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_pet: nil, related_shelter: nil, related_tag: nil, related_user: nil, ship_date: nil, status: nil, total: nil, request_options: {})
        #   @param id [Integer]
        #
        #   @param complete [Boolean]
        #
        #   @param pet_id [Integer]
        #
        #   @param quantity [Integer]
        #
        #   @param related_address [HelloWorldTestingggg::Models::Address]
        #
        #   @param related_category [Object]
        #
        #   @param related_customer [Object]
        #
        #   @param related_money [HelloWorldTestingggg::Models::Money]
        #
        #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
        #
        #   @param related_shelter [Object]
        #
        #   @param related_tag [Object]
        #
        #   @param related_user [Object]
        #
        #   @param ship_date [Time]
        #
        #   @param status [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateParams::Status] Order Status
        #
        #   @param total [HelloWorldTestingggg::Models::Money]
        #
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

        # Order Status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
