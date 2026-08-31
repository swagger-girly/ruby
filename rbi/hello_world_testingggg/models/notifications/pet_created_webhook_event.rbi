# typed: strong

module HelloWorldTestingggg
  module Models
    module Notifications
      class PetCreatedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(HelloWorldTestingggg::PetAPI) }
        attr_reader :pet

        sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
        attr_writer :pet

        sig do
          returns(
            HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            pet: HelloWorldTestingggg::PetAPI::OrHash,
            type:
              HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(pet:, type:)
        end

        sig do
          override.returns(
            {
              pet: HelloWorldTestingggg::PetAPI,
              type:
                HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type::TaggedSymbol
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
                HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PET_CREATED =
            T.let(
              :"pet.created",
              HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent::Type::TaggedSymbol
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
