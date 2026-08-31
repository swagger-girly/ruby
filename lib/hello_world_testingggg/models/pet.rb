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
      #   @return [Object, nil]
      optional :category, HelloWorldTestingggg::Internal::Type::Unknown

      # @!attribute microchip_id
      #   Microchip identifier; legacy chips used numeric identifiers.
      #
      #   @return [String, Integer, nil]
      optional :microchip_id, union: -> { HelloWorldTestingggg::PetAPI::MicrochipID }, api_name: :microchipId

      # @!attribute related_address
      #
      #   @return [HelloWorldTestingggg::Models::Address, nil]
      optional :related_address, -> { HelloWorldTestingggg::Address }, api_name: :relatedAddress

      # @!attribute related_category
      #
      #   @return [Object, nil]
      optional :related_category, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedCategory

      # @!attribute related_customer
      #
      #   @return [Object, nil]
      optional :related_customer, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedCustomer

      # @!attribute related_money
      #
      #   @return [HelloWorldTestingggg::Models::Money, nil]
      optional :related_money, -> { HelloWorldTestingggg::Money }, api_name: :relatedMoney

      # @!attribute related_order
      #
      #   @return [Object, nil]
      optional :related_order, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedOrder

      # @!attribute related_pet
      #
      #   @return [HelloWorldTestingggg::Models::PetAPI, nil]
      optional :related_pet, -> { HelloWorldTestingggg::PetAPI }, api_name: :relatedPet

      # @!attribute related_shelter
      #
      #   @return [Object, nil]
      optional :related_shelter, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedShelter

      # @!attribute related_user
      #
      #   @return [Object, nil]
      optional :related_user, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedUser

      # @!attribute status
      #   pet status in the store
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetStatus, nil]
      optional :status, enum: -> { HelloWorldTestingggg::PetStatus }

      # @!attribute tags
      #
      #   @return [Array<Object>, nil]
      optional :tags,
               HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Internal::Type::Unknown]

      # @!method initialize(name:, photo_urls:, id: nil, acquisition_channel: nil, category: nil, microchip_id: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_user: nil, status: nil, tags: nil)
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
      #   @param category [Object]
      #
      #   @param microchip_id [String, Integer] Microchip identifier; legacy chips used numeric identifiers.
      #
      #   @param related_address [HelloWorldTestingggg::Models::Address]
      #
      #   @param related_category [Object]
      #
      #   @param related_customer [Object]
      #
      #   @param related_money [HelloWorldTestingggg::Models::Money]
      #
      #   @param related_order [Object]
      #
      #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #
      #   @param related_shelter [Object]
      #
      #   @param related_user [Object]
      #
      #   @param status [Symbol, HelloWorldTestingggg::Models::PetStatus] pet status in the store
      #
      #   @param tags [Array<Object>]

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
    end
  end
end
