# typed: strong

module HelloWorldTestingggg
  module Models
    # pet status in the store
    module PetStatus
      extend HelloWorldTestingggg::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, HelloWorldTestingggg::PetStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      AVAILABLE =
        T.let(:available, HelloWorldTestingggg::PetStatus::TaggedSymbol)
      PENDING = T.let(:pending, HelloWorldTestingggg::PetStatus::TaggedSymbol)
      SOLD = T.let(:sold, HelloWorldTestingggg::PetStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[HelloWorldTestingggg::PetStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
