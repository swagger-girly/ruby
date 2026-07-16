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
