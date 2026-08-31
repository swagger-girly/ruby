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

      sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
      attr_reader :related_address

      sig { params(related_address: HelloWorldTestingggg::Address).void }
      attr_writer :related_address

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_category

      sig { params(related_category: T.anything).void }
      attr_writer :related_category

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_customer

      sig { params(related_customer: T.anything).void }
      attr_writer :related_customer

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_order

      sig { params(related_order: T.anything).void }
      attr_writer :related_order

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
      attr_reader :related_pet

      sig { params(related_pet: HelloWorldTestingggg::PetAPI).void }
      attr_writer :related_pet

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_shelter

      sig { params(related_shelter: T.anything).void }
      attr_writer :related_shelter

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_tag

      sig { params(related_tag: T.anything).void }
      attr_writer :related_tag

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_user

      sig { params(related_user: T.anything).void }
      attr_writer :related_user

      sig do
        params(
          amount: Integer,
          currency: String,
          related_address: HelloWorldTestingggg::Address,
          related_category: T.anything,
          related_customer: T.anything,
          related_order: T.anything,
          related_pet: HelloWorldTestingggg::PetAPI,
          related_shelter: T.anything,
          related_tag: T.anything,
          related_user: T.anything
        ).returns(T.attached_class)
      end
      def self.new(
        # Amount in minor currency units (e.g. cents).
        amount:,
        # ISO 4217 currency code.
        currency:,
        related_address: nil,
        related_category: nil,
        related_customer: nil,
        related_order: nil,
        related_pet: nil,
        related_shelter: nil,
        related_tag: nil,
        related_user: nil
      )
      end

      sig do
        override.returns(
          {
            amount: Integer,
            currency: String,
            related_address: HelloWorldTestingggg::Address,
            related_category: T.anything,
            related_customer: T.anything,
            related_order: T.anything,
            related_pet: HelloWorldTestingggg::PetAPI,
            related_shelter: T.anything,
            related_tag: T.anything,
            related_user: T.anything
          }
        )
      end
      def to_hash
      end
    end
  end
end
