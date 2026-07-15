# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class Money < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute amount
      #   Amount in minor currency units (e.g. cents).
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute currency
      #   ISO 4217 currency code.
      #
      #   @return [String]
      required :currency, String

      # @!method initialize(amount:, currency:)
      #   @param amount [Integer] Amount in minor currency units (e.g. cents).
      #
      #   @param currency [String] ISO 4217 currency code.
    end
  end
end
