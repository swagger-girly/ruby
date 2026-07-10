# typed: strong

module HelloWorldTestingggg
  module Models
    class PetInventoryLowWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetInventoryLowWebhookEvent,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(HelloWorldTestingggg::PetAPI) }
      attr_reader :pet

      sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
      attr_writer :pet

      sig { returns(Integer) }
      attr_accessor :quantity

      sig { returns(Integer) }
      attr_accessor :threshold

      sig do
        returns(
          HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder
          )
        )
      end
      attr_reader :last_order

      sig do
        params(
          last_order:
            HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::OrHash
        ).void
      end
      attr_writer :last_order

      sig do
        returns(
          T.nilable(
            T::Array[
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location
            ]
          )
        )
      end
      attr_reader :locations

      sig do
        params(
          locations:
            T::Array[
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location::OrHash
            ]
        ).void
      end
      attr_writer :locations

      sig do
        params(
          pet: HelloWorldTestingggg::PetAPI::OrHash,
          quantity: Integer,
          threshold: Integer,
          type:
            HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type::OrSymbol,
          last_order:
            HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::OrHash,
          locations:
            T::Array[
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        pet:,
        quantity:,
        threshold:,
        type:,
        last_order: nil,
        locations: nil
      )
      end

      sig do
        override.returns(
          {
            pet: HelloWorldTestingggg::PetAPI,
            quantity: Integer,
            threshold: Integer,
            type:
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type::TaggedSymbol,
            last_order:
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder,
            locations:
              T::Array[
                HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location
              ]
          }
        )
      end
      def to_hash
      end

      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PET_INVENTORY_LOW =
          T.let(
            :"pet.inventory-low",
            HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class LastOrder < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :complete

        sig { params(complete: T::Boolean).void }
        attr_writer :complete

        sig { returns(T.nilable(Integer)) }
        attr_reader :pet_id

        sig { params(pet_id: Integer).void }
        attr_writer :pet_id

        sig { returns(T.nilable(Integer)) }
        attr_reader :quantity

        sig { params(quantity: Integer).void }
        attr_writer :quantity

        sig { returns(T.nilable(Time)) }
        attr_reader :ship_date

        sig { params(ship_date: Time).void }
        attr_writer :ship_date

        # Order Status
        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            id: Integer,
            complete: T::Boolean,
            pet_id: Integer,
            quantity: Integer,
            ship_date: Time,
            status:
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          complete: nil,
          pet_id: nil,
          quantity: nil,
          ship_date: nil,
          # Order Status
          status: nil
        )
        end

        sig do
          override.returns(
            {
              id: Integer,
              complete: T::Boolean,
              pet_id: Integer,
              quantity: Integer,
              ship_date: Time,
              status:
                HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Order Status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PLACED =
            T.let(
              :placed,
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
            )
          APPROVED =
            T.let(
              :approved,
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PetInventoryLowWebhookEvent::LastOrder::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Location < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetInventoryLowWebhookEvent::Location,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        sig { returns(T.nilable(String)) }
        attr_reader :street

        sig { params(street: String).void }
        attr_writer :street

        sig { returns(T.nilable(String)) }
        attr_reader :zip

        sig { params(zip: String).void }
        attr_writer :zip

        sig do
          params(
            city: String,
            state: String,
            street: String,
            zip: String
          ).returns(T.attached_class)
        end
        def self.new(city: nil, state: nil, street: nil, zip: nil)
        end

        sig do
          override.returns(
            { city: String, state: String, street: String, zip: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
