# typed: strong

module HelloWorldTestingggg
  module Models
    class Money < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Money,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Amount in minor currency units (e.g. cents).
      sig { returns(Integer) }
      attr_accessor :amount

      # ISO 4217 currency code.
      sig { returns(String) }
      attr_accessor :currency

      sig do
        params(amount: Integer, currency: String).returns(T.attached_class)
      end
      def self.new(
        # Amount in minor currency units (e.g. cents).
        amount:,
        # ISO 4217 currency code.
        currency:
      )
      end

      sig { override.returns({ amount: Integer, currency: String }) }
      def to_hash
      end
    end
  end
end
