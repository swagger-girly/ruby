# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module ConnectClientEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      discriminator :type

      variant :ping, -> { HelloWorldTestingggg::Models::ConnectClientEvent::Ping }

      variant :subscribe, -> { HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe }

      class Ping < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :ping]
        required :type, const: :ping

        # @!method initialize(type: :ping)
        #   @param type [Symbol, :ping]
      end

      class Subscribe < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status]
        required :status, enum: -> { HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status }

        # @!attribute type
        #
        #   @return [Symbol, :subscribe]
        required :type, const: :subscribe

        # @!method initialize(status:, type: :subscribe)
        #   @param status [Symbol, HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status]
        #   @param type [Symbol, :subscribe]

        # @see HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          AVAILABLE = :available
          PENDING = :pending
          SOLD = :sold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::ConnectClientEvent::Ping, HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe)]
    end
  end
end
