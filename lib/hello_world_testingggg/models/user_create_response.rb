# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::User#create
    class UserCreateResponse < HelloWorldTestingggg::Internal::Type::BaseModel
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

      # @!attribute username
      #
      #   @return [String, nil]
      optional :username, String

      # @!attribute user_status
      #   User Status
      #
      #   @return [Integer, nil]
      optional :user_status, Integer, api_name: :userStatus

      # @!method initialize(id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_tag: nil, username: nil, user_status: nil)
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
      #   @param related_address [HelloWorldTestingggg::Models::Address]
      #
      #   @param related_category [Object]
      #
      #   @param related_customer [Object]
      #
      #   @param related_money [HelloWorldTestingggg::Models::Money]
      #
      #   @param related_order [Object]
      #
      #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #
      #   @param related_shelter [Object]
      #
      #   @param related_tag [Object]
      #
      #   @param username [String]
      #
      #   @param user_status [Integer] User Status
    end
  end
end
