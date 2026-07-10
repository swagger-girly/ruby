# typed: strong

module HelloWorldTestingggg
  module Models
    class Fileslist < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Fileslist,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(T::Array[HelloWorldTestingggg::File]) }
      attr_accessor :data

      sig do
        params(data: T::Array[HelloWorldTestingggg::File::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(data:)
      end

      sig { override.returns({ data: T::Array[HelloWorldTestingggg::File] }) }
      def to_hash
      end
    end
  end
end
