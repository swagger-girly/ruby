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
        #   pet status in the store
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PetStatus]
        required :status, enum: -> { HelloWorldTestingggg::PetStatus }

        # @!attribute type
        #
        #   @return [Symbol, :subscribe]
        required :type, const: :subscribe

        # @!method initialize(status:, type: :subscribe)
        #   @param status [Symbol, HelloWorldTestingggg::Models::PetStatus] pet status in the store
        #
        #   @param type [Symbol, :subscribe]
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::ConnectClientEvent::Ping, HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe)]
    end
  end
end
