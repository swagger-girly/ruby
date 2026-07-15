# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # pet status in the store
    module PetStatus
      extend HelloWorldTestingggg::Internal::Type::Enum

      AVAILABLE = :available
      PENDING = :pending
      SOLD = :sold

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
