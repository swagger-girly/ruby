# typed: strong

module HelloWorldTestingggg
  module Models
    class ProfileCreateParams < HelloWorldTestingggg::Models::ProfileCreateRequest
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::ProfileCreateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          idempotency_key: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(idempotency_key: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            idempotency_key: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
