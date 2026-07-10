# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#create_archive
    class FileCreateArchiveParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute files
      #   Files to include in the archive.
      #
      #   @return [Array<Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart>]
      required :files,
               HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Internal::Type::FileInput]

      # @!attribute manifest
      #
      #   @return [HelloWorldTestingggg::Models::FileCreateArchiveParams::Manifest, nil]
      optional :manifest, -> { HelloWorldTestingggg::FileCreateArchiveParams::Manifest }

      # @!method initialize(files:, manifest: nil, request_options: {})
      #   @param files [Array<Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart>] Files to include in the archive.
      #
      #   @param manifest [HelloWorldTestingggg::Models::FileCreateArchiveParams::Manifest]
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      class Manifest < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute labels
        #
        #   @return [Array<String>, nil]
        optional :labels, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

        # @!attribute preserve_paths
        #
        #   @return [Boolean, nil]
        optional :preserve_paths, HelloWorldTestingggg::Internal::Type::Boolean, api_name: :preservePaths

        # @!method initialize(name:, labels: nil, preserve_paths: nil)
        #   @param name [String]
        #   @param labels [Array<String>]
        #   @param preserve_paths [Boolean]
      end
    end
  end
end
