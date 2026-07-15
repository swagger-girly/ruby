# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Order#create
      class OrderCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute complete
        #
        #   @return [Boolean, nil]
        optional :complete, HelloWorldTestingggg::Internal::Type::Boolean

        # @!attribute pet_id
        #
        #   @return [Integer, nil]
        optional :pet_id, Integer, api_name: :petId

        # @!attribute quantity
        #
        #   @return [Integer, nil]
        optional :quantity, Integer

        # @!attribute ship_date
        #
        #   @return [Time, nil]
        optional :ship_date, Time, api_name: :shipDate

        # @!attribute status
        #   Order Status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateParams::Status, nil]
        optional :status, enum: -> { HelloWorldTestingggg::Store::OrderCreateParams::Status }

        # @!attribute total
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :total, -> { HelloWorldTestingggg::Money }

        # @!method initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil, total: nil, request_options: {})
        #   @param id [Integer]
        #
        #   @param complete [Boolean]
        #
        #   @param pet_id [Integer]
        #
        #   @param quantity [Integer]
        #
        #   @param ship_date [Time]
        #
        #   @param status [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateParams::Status] Order Status
        #
        #   @param total [HelloWorldTestingggg::Models::Money]
        #
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

        # Order Status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
