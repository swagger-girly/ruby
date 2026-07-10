# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class OrderDeleteParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::OrderDeleteParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :order_id

        sig do
          params(
            order_id: Integer,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(order_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              order_id: Integer,
              request_options: HelloWorldTestingggg::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
