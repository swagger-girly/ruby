# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Order#create
      class OrderCreateResponse < HelloWorldTestingggg::Internal::Type::BaseModel
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
        #   @return [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateResponse::Status, nil]
        optional :status, enum: -> { HelloWorldTestingggg::Models::Store::OrderCreateResponse::Status }

        # @!method initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil)
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
        #   @param status [Symbol, HelloWorldTestingggg::Models::Store::OrderCreateResponse::Status] Order Status

        # Order Status
        #
        # @see HelloWorldTestingggg::Models::Store::OrderCreateResponse#status
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
