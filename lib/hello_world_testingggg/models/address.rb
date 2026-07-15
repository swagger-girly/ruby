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

      # @!method initialize(city: nil, geo: nil, state: nil, street: nil, zip: nil)
      #   @param city [String]
      #   @param geo [HelloWorldTestingggg::Models::Address::Geo]
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
