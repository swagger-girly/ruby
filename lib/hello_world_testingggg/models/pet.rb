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

      # @!attribute acquisition_channel
      #   How the pet entered the store. Open enum: known channels plus forward-compatible
      #   free-form strings.
      #
      #   @return [Symbol, String, HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel, nil]
      optional :acquisition_channel,
               union: -> { HelloWorldTestingggg::PetAPI::AcquisitionChannel },
               api_name: :acquisitionChannel

      # @!attribute category
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI::Category, nil]
      optional :category, -> { HelloWorldTestingggg::PetAPI::Category }

      # @!attribute microchip_id
      #   Microchip identifier; legacy chips used numeric identifiers.
      #
      #   @return [String, Integer, nil]
      optional :microchip_id, union: -> { HelloWorldTestingggg::PetAPI::MicrochipID }, api_name: :microchipId

      # @!attribute status
      #   pet status in the store
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetStatus, nil]
      optional :status, enum: -> { HelloWorldTestingggg::PetStatus }

      # @!attribute tags
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetAPI::Tag>, nil]
      optional :tags, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag] }

      # @!method initialize(name:, photo_urls:, id: nil, acquisition_channel: nil, category: nil, microchip_id: nil, status: nil, tags: nil)
      #   Some parameter documentations has been truncated, see
      #   {HelloWorldTestingggg::Models::PetAPI} for more details.
      #
      #   @param name [String]
      #
      #   @param photo_urls [Array<String>]
      #
      #   @param id [Integer]
      #
      #   @param acquisition_channel [Symbol, String, HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel] How the pet entered the store. Open enum: known channels plus forward-compatible
      #
      #   @param category [HelloWorldTestingggg::Models::PetAPI::Category]
      #
      #   @param microchip_id [String, Integer] Microchip identifier; legacy chips used numeric identifiers.
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::PetStatus] pet status in the store
      #
      #   @param tags [Array<HelloWorldTestingggg::Models::PetAPI::Tag>]

      # How the pet entered the store. Open enum: known channels plus forward-compatible
      # free-form strings.
      #
      # @see HelloWorldTestingggg::Models::PetAPI#acquisition_channel
      module AcquisitionChannel
        extend HelloWorldTestingggg::Internal::Type::Union

        variant const: -> { HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel::BREEDER }

        variant const: -> { HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel::SHELTER }

        variant const: -> { HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel::SURRENDER }

        variant const: -> { HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel::TRANSFER }

        variant String

        # @!method self.variants
        #   @return [Array(Symbol, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol, String) }
        end

        # @!group

        BREEDER = :breeder
        SHELTER = :shelter
        SURRENDER = :surrender
        TRANSFER = :transfer

        # @!endgroup
      end

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

        # @!attribute subcategories
        #   Nested subcategories; the tree can recurse arbitrarily deep.
        #
        #   @return [Array<Object>, nil]
        optional :subcategories,
                 HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Internal::Type::Unknown]

        # @!method initialize(id: nil, name: nil, subcategories: nil)
        #   @param id [Integer]
        #
        #   @param name [String]
        #
        #   @param subcategories [Array<Object>] Nested subcategories; the tree can recurse arbitrarily deep.
      end

      # Microchip identifier; legacy chips used numeric identifiers.
      #
      # @see HelloWorldTestingggg::Models::PetAPI#microchip_id
      module MicrochipID
        extend HelloWorldTestingggg::Internal::Type::Union

        variant String

        variant Integer

        # @!method self.variants
        #   @return [Array(String, Integer)]
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
