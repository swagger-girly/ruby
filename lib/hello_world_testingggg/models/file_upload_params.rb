# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#upload
    class FileUploadParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute file
      #   The file to upload.
      #
      #   @return [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart]
      required :file, HelloWorldTestingggg::Internal::Type::FileInput

      # @!attribute expires_in
      #   Optional expiration in seconds.
      #
      #   @return [Integer, nil]
      optional :expires_in, Integer, api_name: :expiresIn

      # @!attribute metadata
      #   Additional metadata to store with the file.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, HelloWorldTestingggg::Internal::Type::HashOf[String]

      # @!attribute path
      #   Optional storage path for the uploaded file.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute public
      #   Whether the file should be publicly readable.
      #
      #   @return [Boolean, nil]
      optional :public, HelloWorldTestingggg::Internal::Type::Boolean

      # @!attribute tags
      #   Tags to associate with the file.
      #
      #   @return [Array<String>, nil]
      optional :tags, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

      # @!method initialize(file:, expires_in: nil, metadata: nil, path: nil, public: nil, tags: nil, request_options: {})
      #   @param file [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] The file to upload.
      #
      #   @param expires_in [Integer] Optional expiration in seconds.
      #
      #   @param metadata [Hash{Symbol=>String}] Additional metadata to store with the file.
      #
      #   @param path [String] Optional storage path for the uploaded file.
      #
      #   @param public [Boolean] Whether the file should be publicly readable.
      #
      #   @param tags [Array<String>] Tags to associate with the file.
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
