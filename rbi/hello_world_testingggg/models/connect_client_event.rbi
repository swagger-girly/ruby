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

        sig do
          returns(
            HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::OrSymbol
          )
        end
        attr_accessor :status

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            status:
              HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(status:, type: :subscribe)
        end

        sig do
          override.returns(
            {
              status:
                HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::OrSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AVAILABLE =
            T.let(
              :available,
              HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::TaggedSymbol
            )
          SOLD =
            T.let(
              :sold,
              HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::ConnectClientEvent::Subscribe::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
