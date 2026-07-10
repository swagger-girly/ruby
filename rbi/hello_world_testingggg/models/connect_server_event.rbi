# typed: strong

module HelloWorldTestingggg
  module Models
    module ConnectServerEvent
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::ConnectServerEvent::Pong,
            HelloWorldTestingggg::Models::ConnectServerEvent::Status
          )
        end

      class Pong < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::ConnectServerEvent::Pong,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :pong)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end

      class Status < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::ConnectServerEvent::Status,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(HelloWorldTestingggg::PetAPI) }
        attr_reader :pet

        sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
        attr_writer :pet

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            pet: HelloWorldTestingggg::PetAPI::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(pet:, type: :status)
        end

        sig do
          override.returns({ pet: HelloWorldTestingggg::PetAPI, type: Symbol })
        end
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[HelloWorldTestingggg::Models::ConnectServerEvent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
