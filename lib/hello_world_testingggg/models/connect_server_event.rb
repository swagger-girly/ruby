# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module ConnectServerEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      discriminator :type

      variant :pong, -> { HelloWorldTestingggg::Models::ConnectServerEvent::Pong }

      variant :status, -> { HelloWorldTestingggg::Models::ConnectServerEvent::Status }

      class Pong < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :pong]
        required :type, const: :pong

        # @!method initialize(type: :pong)
        #   @param type [Symbol, :pong]
      end

      class Status < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute pet
        #
        #   @return [HelloWorldTestingggg::Models::PetAPI]
        required :pet, -> { HelloWorldTestingggg::PetAPI }

        # @!attribute type
        #
        #   @return [Symbol, :status]
        required :type, const: :status

        # @!method initialize(pet:, type: :status)
        #   @param pet [HelloWorldTestingggg::Models::PetAPI]
        #   @param type [Symbol, :status]
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::ConnectServerEvent::Pong, HelloWorldTestingggg::Models::ConnectServerEvent::Status)]
    end
  end
end
