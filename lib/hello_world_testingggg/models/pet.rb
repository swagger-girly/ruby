# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#create
    class PetAPI < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute photo_urls
      #
      #   @return [Array<String>]
      required :photo_urls, HelloWorldTestingggg::Internal::Type::ArrayOf[String], api_name: :photoUrls

      # @!attribute id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!attribute category
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI::Category, nil]
      optional :category, -> { HelloWorldTestingggg::PetAPI::Category }

      # @!attribute status
      #   pet status in the store
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetAPI::Status, nil]
      optional :status, enum: -> { HelloWorldTestingggg::PetAPI::Status }

      # @!attribute tags
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetAPI::Tag>, nil]
      optional :tags, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag] }

      # @!method initialize(name:, photo_urls:, id: nil, category: nil, status: nil, tags: nil)
      #   @param name [String]
      #
      #   @param photo_urls [Array<String>]
      #
      #   @param id [Integer]
      #
      #   @param category [HelloWorldTestingggg::Models::PetAPI::Category]
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::PetAPI::Status] pet status in the store
      #
      #   @param tags [Array<HelloWorldTestingggg::Models::PetAPI::Tag>]

      # @see HelloWorldTestingggg::Models::PetAPI#category
      class Category < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(id: nil, name: nil)
        #   @param id [Integer]
        #   @param name [String]
      end

      # pet status in the store
      #
      # @see HelloWorldTestingggg::Models::PetAPI#status
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        AVAILABLE = :available
        PENDING = :pending
        SOLD = :sold

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Tag < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(id: nil, name: nil)
        #   @param id [Integer]
        #   @param name [String]
      end
    end
  end
end
