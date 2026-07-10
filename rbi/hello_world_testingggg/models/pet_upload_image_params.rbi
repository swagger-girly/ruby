# typed: strong

module HelloWorldTestingggg
  module Models
    class PetUploadImageParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetUploadImageParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :pet_id

      sig { returns(HelloWorldTestingggg::Internal::FileInput) }
      attr_accessor :body

      # Additional Metadata
      sig { returns(T.nilable(String)) }
      attr_reader :additional_metadata

      sig { params(additional_metadata: String).void }
      attr_writer :additional_metadata

      sig do
        params(
          pet_id: Integer,
          body: HelloWorldTestingggg::Internal::FileInput,
          additional_metadata: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        pet_id:,
        body:,
        # Additional Metadata
        additional_metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            body: HelloWorldTestingggg::Internal::FileInput,
            additional_metadata: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
