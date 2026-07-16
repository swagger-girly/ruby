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

      # Microchip identifier; legacy chips used numeric identifiers.
      sig do
        returns(T.nilable(HelloWorldTestingggg::PetAPI::MicrochipID::Variants))
      end
      attr_reader :microchip_id

      sig do
        params(
          microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants
        ).void
      end
      attr_writer :microchip_id

      # pet status in the store
      sig { returns(T.nilable(HelloWorldTestingggg::PetStatus::TaggedSymbol)) }
      attr_reader :status

      sig { params(status: HelloWorldTestingggg::PetStatus::OrSymbol).void }
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
          microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
          status: HelloWorldTestingggg::PetStatus::OrSymbol,
          tags: T::Array[HelloWorldTestingggg::PetAPI::Tag::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        photo_urls:,
        id: nil,
        category: nil,
        # Microchip identifier; legacy chips used numeric identifiers.
        microchip_id: nil,
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
            microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
            status: HelloWorldTestingggg::PetStatus::TaggedSymbol,
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

        # Nested subcategories; the tree can recurse arbitrarily deep.
        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :subcategories

        sig { params(subcategories: T::Array[T.anything]).void }
        attr_writer :subcategories

        sig do
          params(
            id: Integer,
            name: String,
            subcategories: T::Array[T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          name: nil,
          # Nested subcategories; the tree can recurse arbitrarily deep.
          subcategories: nil
        )
        end

        sig do
          override.returns(
            { id: Integer, name: String, subcategories: T::Array[T.anything] }
          )
        end
        def to_hash
        end
      end

      # Microchip identifier; legacy chips used numeric identifiers.
      module MicrochipID
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Integer) }

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::PetAPI::MicrochipID::Variants]
          )
        end
        def self.variants
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
