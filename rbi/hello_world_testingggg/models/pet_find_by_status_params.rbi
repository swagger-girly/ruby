# typed: strong

module HelloWorldTestingggg
  module Models
    class PetFindByStatusParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetFindByStatusParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Status values that need to be considered for filter
      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::PetFindByStatusParams::Status::OrSymbol
          )
        )
      end
      attr_reader :status

      sig do
        params(
          status: HelloWorldTestingggg::PetFindByStatusParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          status: HelloWorldTestingggg::PetFindByStatusParams::Status::OrSymbol,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Status values that need to be considered for filter
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            status:
              HelloWorldTestingggg::PetFindByStatusParams::Status::OrSymbol,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Status values that need to be considered for filter
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::PetFindByStatusParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AVAILABLE =
          T.let(
            :available,
            HelloWorldTestingggg::PetFindByStatusParams::Status::TaggedSymbol
          )
        PENDING =
          T.let(
            :pending,
            HelloWorldTestingggg::PetFindByStatusParams::Status::TaggedSymbol
          )
        SOLD =
          T.let(
            :sold,
            HelloWorldTestingggg::PetFindByStatusParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::PetFindByStatusParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
