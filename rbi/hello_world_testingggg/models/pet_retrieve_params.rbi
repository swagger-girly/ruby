# typed: strong

module HelloWorldTestingggg
  module Models
    class PetRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetRetrieveParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :pet_id

      sig do
        params(
          pet_id: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(pet_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
