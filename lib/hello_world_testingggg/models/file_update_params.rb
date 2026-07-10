# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#update
    class FileUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute path
      #
      #   @return [String]
      required :path, String

      # @!attribute file
      #   Replacement file content.
      #
      #   @return [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart, nil]
      optional :file, HelloWorldTestingggg::Internal::Type::FileInput

      # @!attribute metadata
      #   Metadata to merge onto the stored file.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, HelloWorldTestingggg::Internal::Type::HashOf[String]

      # @!attribute url
      #   URL to fetch replacement file content from.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(path:, file: nil, metadata: nil, url: nil, request_options: {})
      #   @param path [String]
      #
      #   @param file [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] Replacement file content.
      #
      #   @param metadata [Hash{Symbol=>String}] Metadata to merge onto the stored file.
      #
      #   @param url [String] URL to fetch replacement file content from.
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
