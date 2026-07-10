# typed: strong

module HelloWorldTestingggg
  module Models
    class PetListFakePageInferredResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::PetListFakePageInferredResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(T::Array[HelloWorldTestingggg::PetAPI]) }
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig do
        params(
          data: T::Array[HelloWorldTestingggg::PetAPI::OrHash],
          has_more: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, has_more:)
      end

      sig do
        override.returns(
          { data: T::Array[HelloWorldTestingggg::PetAPI], has_more: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
