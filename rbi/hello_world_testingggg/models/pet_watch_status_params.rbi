# typed: strong

module HelloWorldTestingggg
  module Models
    class PetWatchStatusParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetWatchStatusParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :pet_id

      sig { returns(T.nilable(String)) }
      attr_reader :last_event_id

      sig { params(last_event_id: String).void }
      attr_writer :last_event_id

      sig do
        params(
          pet_id: Integer,
          last_event_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(pet_id:, last_event_id: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            last_event_id: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
