# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#update
    class File < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute last_modified
      #   Timestamp when the file was last modified.
      #
      #   @return [Time]
      required :last_modified, Time, api_name: :lastModified

      # @!attribute path
      #   Path to the file in storage.
      #
      #   @return [String]
      required :path, String

      # @!attribute size
      #   Size of the file in bytes.
      #
      #   @return [Integer]
      required :size, Integer

      # @!attribute content_type
      #   Detected MIME type for the file.
      #
      #   @return [String, nil]
      optional :content_type, String, api_name: :contentType

      # @!method initialize(last_modified:, path:, size:, content_type: nil)
      #   @param last_modified [Time] Timestamp when the file was last modified.
      #
      #   @param path [String] Path to the file in storage.
      #
      #   @param size [Integer] Size of the file in bytes.
      #
      #   @param content_type [String] Detected MIME type for the file.
    end
  end
end
