# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class Address < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute city
      #
      #   @return [String, nil]
      optional :city, String

      # @!attribute geo
      #
      #   @return [HelloWorldTestingggg::Models::Address::Geo, nil]
      optional :geo, -> { HelloWorldTestingggg::Address::Geo }

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

      # @!attribute related_user
      #
      #   @return [Object, nil]
      optional :related_user, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedUser

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

      # @!method initialize(city: nil, geo: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_tag: nil, related_user: nil, state: nil, street: nil, zip: nil)
      #   @param city [String]
      #   @param geo [HelloWorldTestingggg::Models::Address::Geo]
      #   @param related_category [Object]
      #   @param related_customer [Object]
      #   @param related_money [HelloWorldTestingggg::Models::Money]
      #   @param related_order [Object]
      #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #   @param related_shelter [Object]
      #   @param related_tag [Object]
      #   @param related_user [Object]
      #   @param state [String]
      #   @param street [String]
      #   @param zip [String]

      # @see HelloWorldTestingggg::Models::Address#geo
      class Geo < HelloWorldTestingggg::Internal::Type::BaseModel
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
end
