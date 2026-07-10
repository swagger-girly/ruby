# typed: strong

module HelloWorldTestingggg
  module Models
    class Archive < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Archive,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(HelloWorldTestingggg::Archive::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(Integer)) }
      attr_reader :file_count

      sig { params(file_count: Integer).void }
      attr_writer :file_count

      sig do
        params(
          id: String,
          status: HelloWorldTestingggg::Archive::Status::OrSymbol,
          file_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(id:, status:, file_count: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            status: HelloWorldTestingggg::Archive::Status::TaggedSymbol,
            file_count: Integer
          }
        )
      end
      def to_hash
      end

      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, HelloWorldTestingggg::Archive::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(:queued, HelloWorldTestingggg::Archive::Status::TaggedSymbol)
        PROCESSING =
          T.let(
            :processing,
            HelloWorldTestingggg::Archive::Status::TaggedSymbol
          )
        COMPLETE =
          T.let(:complete, HelloWorldTestingggg::Archive::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Archive::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
