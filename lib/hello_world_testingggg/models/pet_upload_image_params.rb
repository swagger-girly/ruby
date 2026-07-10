# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#upload_image
    class PetUploadImageParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute pet_id
      #
      #   @return [Integer]
      required :pet_id, Integer

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart]
      required :body, HelloWorldTestingggg::Internal::Type::FileInput

      # @!attribute additional_metadata
      #   Additional Metadata
      #
      #   @return [String, nil]
      optional :additional_metadata, String

      # @!method initialize(pet_id:, body:, additional_metadata: nil, request_options: {})
      #   @param pet_id [Integer]
      #
      #   @param body [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart]
      #
      #   @param additional_metadata [String] Additional Metadata
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
