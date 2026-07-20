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

      # How the pet entered the store. Open enum: known channels plus forward-compatible
      # free-form strings.
      sig do
        returns(
          T.nilable(HelloWorldTestingggg::PetAPI::AcquisitionChannel::Variants)
        )
      end
      attr_reader :acquisition_channel

      sig do
        params(
          acquisition_channel:
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
              String
            )
        ).void
      end
      attr_writer :acquisition_channel

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
          acquisition_channel:
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
              String
            ),
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
        # How the pet entered the store. Open enum: known channels plus forward-compatible
        # free-form strings.
        acquisition_channel: nil,
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
            acquisition_channel:
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::Variants,
            category: HelloWorldTestingggg::PetAPI::Category,
            microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
            status: HelloWorldTestingggg::PetStatus::TaggedSymbol,
            tags: T::Array[HelloWorldTestingggg::PetAPI::Tag]
          }
        )
      end
      def to_hash
      end

      # How the pet entered the store. Open enum: known channels plus forward-compatible
      # free-form strings.
      module AcquisitionChannel
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol,
              String
            )
          end

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::PetAPI::AcquisitionChannel::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::PetAPI::AcquisitionChannel)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BREEDER =
          T.let(
            :breeder,
            HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol
          )
        SHELTER =
          T.let(
            :shelter,
            HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol
          )
        SURRENDER =
          T.let(
            :surrender,
            HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol
          )
        TRANSFER =
          T.let(
            :transfer,
            HelloWorldTestingggg::PetAPI::AcquisitionChannel::TaggedSymbol
          )
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
