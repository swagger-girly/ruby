# typed: strong

module HelloWorldTestingggg
  module Models
    class MediaSchemaOnJsonResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::MediaSchemaOnJsonResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(String)) }
      attr_reader :label

      sig { params(label: String).void }
      attr_writer :label

      sig { params(id: String, label: String).returns(T.attached_class) }
      def self.new(id:, label: nil)
      end

      sig { override.returns({ id: String, label: String }) }
      def to_hash
      end
    end
  end
end
