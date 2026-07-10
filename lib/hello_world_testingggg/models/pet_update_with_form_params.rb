# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#update_with_form
    class PetUpdateWithFormParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute pet_id
      #
      #   @return [Integer]
      required :pet_id, Integer

      # @!attribute name
      #   Name of pet that needs to be updated
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #   Status of pet that needs to be updated
      #
      #   @return [String, nil]
      optional :status, String

      # @!method initialize(pet_id:, name: nil, status: nil, request_options: {})
      #   @param pet_id [Integer]
      #
      #   @param name [String] Name of pet that needs to be updated
      #
      #   @param status [String] Status of pet that needs to be updated
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
