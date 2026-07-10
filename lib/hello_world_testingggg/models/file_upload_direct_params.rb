# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#upload_direct
    class FileUploadDirectParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart]
      required :body, HelloWorldTestingggg::Internal::Type::FileInput

      # @!attribute path
      #   Optional storage path for the raw file.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute x_file_name
      #
      #   @return [String, nil]
      optional :x_file_name, String

      # @!method initialize(body:, path: nil, x_file_name: nil, request_options: {})
      #   @param body [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart]
      #
      #   @param path [String] Optional storage path for the raw file.
      #
      #   @param x_file_name [String]
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
