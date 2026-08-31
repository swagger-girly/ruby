# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class Money < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute amount
      #   Amount in minor currency units (e.g. cents).
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute currency
      #   ISO 4217 currency code.
      #
      #   @return [String]
      required :currency, String

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

      # @!attribute related_order
      #
      #   @return [Object, nil]
      optional :related_order, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedOrder

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

      # @!method initialize(amount:, currency:, related_address: nil, related_category: nil, related_customer: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_tag: nil, related_user: nil)
      #   @param amount [Integer] Amount in minor currency units (e.g. cents).
      #
      #   @param currency [String] ISO 4217 currency code.
      #
      #   @param related_address [HelloWorldTestingggg::Models::Address]
      #
      #   @param related_category [Object]
      #
      #   @param related_customer [Object]
      #
      #   @param related_order [Object]
      #
      #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #
      #   @param related_shelter [Object]
      #
      #   @param related_tag [Object]
      #
      #   @param related_user [Object]
    end
  end
end
