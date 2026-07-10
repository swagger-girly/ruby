# typed: strong

module HelloWorldTestingggg
  module Models
    class StoreListInventoryParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::StoreListInventoryParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns(
          { request_options: HelloWorldTestingggg::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
