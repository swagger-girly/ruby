# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class OrderCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::OrderCreateParams,
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

        sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
        attr_reader :related_address

        sig do
          params(related_address: HelloWorldTestingggg::Address::OrHash).void
        end
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

        sig { params(related_money: HelloWorldTestingggg::Money::OrHash).void }
        attr_writer :related_money

        sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
        attr_reader :related_pet

        sig { params(related_pet: HelloWorldTestingggg::PetAPI::OrHash).void }
        attr_writer :related_pet

        sig { returns(T.nilable(T.anything)) }
        attr_reader :related_shelter

        sig { params(related_shelter: T.anything).void }
        attr_writer :related_shelter

        sig { returns(T.nilable(T.anything)) }
        attr_reader :related_tag

        sig { params(related_tag: T.anything).void }
        attr_writer :related_tag

        sig { returns(T.nilable(T.anything)) }
        attr_reader :related_user

        sig { params(related_user: T.anything).void }
        attr_writer :related_user

        sig { returns(T.nilable(Time)) }
        attr_reader :ship_date

        sig { params(ship_date: Time).void }
        attr_writer :ship_date

        # Order Status
        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Store::OrderCreateParams::Status::OrSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              HelloWorldTestingggg::Store::OrderCreateParams::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
        attr_reader :total

        sig { params(total: HelloWorldTestingggg::Money::OrHash).void }
        attr_writer :total

        sig do
          params(
            id: Integer,
            complete: T::Boolean,
            pet_id: Integer,
            quantity: Integer,
            related_address: HelloWorldTestingggg::Address::OrHash,
            related_category: T.anything,
            related_customer: T.anything,
            related_money: HelloWorldTestingggg::Money::OrHash,
            related_pet: HelloWorldTestingggg::PetAPI::OrHash,
            related_shelter: T.anything,
            related_tag: T.anything,
            related_user: T.anything,
            ship_date: Time,
            status:
              HelloWorldTestingggg::Store::OrderCreateParams::Status::OrSymbol,
            total: HelloWorldTestingggg::Money::OrHash,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          complete: nil,
          pet_id: nil,
          quantity: nil,
          related_address: nil,
          related_category: nil,
          related_customer: nil,
          related_money: nil,
          related_pet: nil,
          related_shelter: nil,
          related_tag: nil,
          related_user: nil,
          ship_date: nil,
          # Order Status
          status: nil,
          total: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: Integer,
              complete: T::Boolean,
              pet_id: Integer,
              quantity: Integer,
              related_address: HelloWorldTestingggg::Address,
              related_category: T.anything,
              related_customer: T.anything,
              related_money: HelloWorldTestingggg::Money,
              related_pet: HelloWorldTestingggg::PetAPI,
              related_shelter: T.anything,
              related_tag: T.anything,
              related_user: T.anything,
              ship_date: Time,
              status:
                HelloWorldTestingggg::Store::OrderCreateParams::Status::OrSymbol,
              total: HelloWorldTestingggg::Money,
              request_options: HelloWorldTestingggg::RequestOptions
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
                HelloWorldTestingggg::Store::OrderCreateParams::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PLACED =
            T.let(
              :placed,
              HelloWorldTestingggg::Store::OrderCreateParams::Status::TaggedSymbol
            )
          APPROVED =
            T.let(
              :approved,
              HelloWorldTestingggg::Store::OrderCreateParams::Status::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              HelloWorldTestingggg::Store::OrderCreateParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Store::OrderCreateParams::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
