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
          T.nilable(
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
              String
            )
          )
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

      sig { returns(T.nilable(T.anything)) }
      attr_reader :category

      sig { params(category: T.anything).void }
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

      sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
      attr_reader :related_address

      sig { params(related_address: HelloWorldTestingggg::Address).void }
      attr_writer :related_address

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_category

      sig { params(related_category: T.anything).void }
      attr_writer :related_category

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_customer

      sig { params(related_customer: T.anything).void }
      attr_writer :related_customer

      sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
      attr_reader :related_money

      sig { params(related_money: HelloWorldTestingggg::Money).void }
      attr_writer :related_money

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_order

      sig { params(related_order: T.anything).void }
      attr_writer :related_order

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
      attr_reader :related_pet

      sig { params(related_pet: HelloWorldTestingggg::PetAPI).void }
      attr_writer :related_pet

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_shelter

      sig { params(related_shelter: T.anything).void }
      attr_writer :related_shelter

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_user

      sig { params(related_user: T.anything).void }
      attr_writer :related_user

      # pet status in the store
      sig { returns(T.nilable(HelloWorldTestingggg::PetStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: HelloWorldTestingggg::PetStatus::OrSymbol).void }
      attr_writer :status

      sig { returns(T.nilable(T::Array[T.anything])) }
      attr_reader :tags

      sig { params(tags: T::Array[T.anything]).void }
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
          category: T.anything,
          microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
          related_address: HelloWorldTestingggg::Address,
          related_category: T.anything,
          related_customer: T.anything,
          related_money: HelloWorldTestingggg::Money,
          related_order: T.anything,
          related_pet: HelloWorldTestingggg::PetAPI,
          related_shelter: T.anything,
          related_user: T.anything,
          status: HelloWorldTestingggg::PetStatus::OrSymbol,
          tags: T::Array[T.anything]
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
        related_address: nil,
        related_category: nil,
        related_customer: nil,
        related_money: nil,
        related_order: nil,
        related_pet: nil,
        related_shelter: nil,
        related_user: nil,
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
              T.any(
                HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
                String
              ),
            category: T.anything,
            microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
            related_address: HelloWorldTestingggg::Address,
            related_category: T.anything,
            related_customer: T.anything,
            related_money: HelloWorldTestingggg::Money,
            related_order: T.anything,
            related_pet: HelloWorldTestingggg::PetAPI,
            related_shelter: T.anything,
            related_user: T.anything,
            status: HelloWorldTestingggg::PetStatus::OrSymbol,
            tags: T::Array[T.anything]
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
    end
  end
end
