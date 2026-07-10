# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#create_archive
    class Archive < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::Archive::Status]
      required :status, enum: -> { HelloWorldTestingggg::Archive::Status }

      # @!attribute file_count
      #
      #   @return [Integer, nil]
      optional :file_count, Integer, api_name: :fileCount

      # @!method initialize(id:, status:, file_count: nil)
      #   @param id [String]
      #   @param status [Symbol, HelloWorldTestingggg::Models::Archive::Status]
      #   @param file_count [Integer]

      # @see HelloWorldTestingggg::Models::Archive#status
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        QUEUED = :queued
        PROCESSING = :processing
        COMPLETE = :complete

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
