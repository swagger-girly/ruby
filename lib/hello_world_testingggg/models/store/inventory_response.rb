# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      class InventoryResponse < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<HelloWorldTestingggg::Models::Store::InventoryResponse::Data>]
        required :data,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Store::InventoryResponse::Data] }

        # @!method initialize(data:)
        #   @param data [Array<HelloWorldTestingggg::Models::Store::InventoryResponse::Data>]

        class Data < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute quantity
          #
          #   @return [Integer]
          required :quantity, Integer

          # @!attribute sku
          #
          #   @return [String]
          required :sku, String

          # @!attribute attributes
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :attributes, HelloWorldTestingggg::Internal::Type::HashOf[String]

          # @!attribute pet_id
          #
          #   @return [Integer, nil]
          optional :pet_id, Integer, api_name: :petId, nil?: true

          # @!method initialize(quantity:, sku:, attributes: nil, pet_id: nil)
          #   @param quantity [Integer]
          #   @param sku [String]
          #   @param attributes [Hash{Symbol=>String}]
          #   @param pet_id [Integer, nil]
        end
      end
    end
  end
end
