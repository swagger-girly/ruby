# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class InventoryResponse < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::InventoryResponse,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[HelloWorldTestingggg::Store::InventoryResponse::Data]
          )
        end
        attr_accessor :data

        sig do
          params(
            data:
              T::Array[
                HelloWorldTestingggg::Store::InventoryResponse::Data::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(data:)
        end

        sig do
          override.returns(
            {
              data:
                T::Array[HelloWorldTestingggg::Store::InventoryResponse::Data]
            }
          )
        end
        def to_hash
        end

        class Data < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Store::InventoryResponse::Data,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :quantity

          sig { returns(String) }
          attr_accessor :sku

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :attributes

          sig { params(attributes: T::Hash[Symbol, String]).void }
          attr_writer :attributes

          sig { returns(T.nilable(Integer)) }
          attr_accessor :pet_id

          sig do
            params(
              quantity: Integer,
              sku: String,
              attributes: T::Hash[Symbol, String],
              pet_id: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(quantity:, sku:, attributes: nil, pet_id: nil)
          end

          sig do
            override.returns(
              {
                quantity: Integer,
                sku: String,
                attributes: T::Hash[Symbol, String],
                pet_id: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
