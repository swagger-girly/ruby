# typed: strong

module HelloWorldTestingggg
  module Models
    class PetListUnpaginatedResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::PetListUnpaginatedResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(T::Array[HelloWorldTestingggg::PetAPI]) }
      attr_accessor :items

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          items: T::Array[HelloWorldTestingggg::PetAPI::OrHash],
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(items:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            items: T::Array[HelloWorldTestingggg::PetAPI],
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
