# typed: strong

module HelloWorldTestingggg
  module Models
    module ConnectClientEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::ConnectClientEvent::Ping,
            HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe
          )
        end

      class Ping < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::ConnectClientEvent::Ping,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :ping)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end

      class Subscribe < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # pet status in the store
        sig { returns(HelloWorldTestingggg::PetStatus::OrSymbol) }
        attr_accessor :status

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            status: HelloWorldTestingggg::PetStatus::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # pet status in the store
          status:,
          type: :subscribe
        )
        end

        sig do
          override.returns(
            { status: HelloWorldTestingggg::PetStatus::OrSymbol, type: Symbol }
          )
        end
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[HelloWorldTestingggg::Models::ConnectClientEvent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
