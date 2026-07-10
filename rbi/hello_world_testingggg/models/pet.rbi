# typed: strong

module HelloWorldTestingggg
  module Models
    class PetAPI < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetAPI,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T::Array[String]) }
      attr_accessor :photo_urls

      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI::Category)) }
      attr_reader :category

      sig do
        params(category: HelloWorldTestingggg::PetAPI::Category::OrHash).void
      end
      attr_writer :category

      # pet status in the store
      sig do
        returns(T.nilable(HelloWorldTestingggg::PetAPI::Status::TaggedSymbol))
      end
      attr_reader :status

      sig do
        params(status: HelloWorldTestingggg::PetAPI::Status::OrSymbol).void
      end
      attr_writer :status

      sig { returns(T.nilable(T::Array[HelloWorldTestingggg::PetAPI::Tag])) }
      attr_reader :tags

      sig do
        params(tags: T::Array[HelloWorldTestingggg::PetAPI::Tag::OrHash]).void
      end
      attr_writer :tags

      sig do
        params(
          name: String,
          photo_urls: T::Array[String],
          id: Integer,
          category: HelloWorldTestingggg::PetAPI::Category::OrHash,
          status: HelloWorldTestingggg::PetAPI::Status::OrSymbol,
          tags: T::Array[HelloWorldTestingggg::PetAPI::Tag::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        photo_urls:,
        id: nil,
        category: nil,
        # pet status in the store
        status: nil,
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            photo_urls: T::Array[String],
            id: Integer,
            category: HelloWorldTestingggg::PetAPI::Category,
            status: HelloWorldTestingggg::PetAPI::Status::TaggedSymbol,
            tags: T::Array[HelloWorldTestingggg::PetAPI::Tag]
          }
        )
      end
      def to_hash
      end

      class Category < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetAPI::Category,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { params(id: Integer, name: String).returns(T.attached_class) }
        def self.new(id: nil, name: nil)
        end

        sig { override.returns({ id: Integer, name: String }) }
        def to_hash
        end
      end

      # pet status in the store
      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, HelloWorldTestingggg::PetAPI::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AVAILABLE =
          T.let(:available, HelloWorldTestingggg::PetAPI::Status::TaggedSymbol)
        PENDING =
          T.let(:pending, HelloWorldTestingggg::PetAPI::Status::TaggedSymbol)
        SOLD = T.let(:sold, HelloWorldTestingggg::PetAPI::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::PetAPI::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Tag < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetAPI::Tag,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { params(id: Integer, name: String).returns(T.attached_class) }
        def self.new(id: nil, name: nil)
        end

        sig { override.returns({ id: Integer, name: String }) }
        def to_hash
        end
      end
    end
  end
end
