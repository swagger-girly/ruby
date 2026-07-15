# typed: strong

module HelloWorldTestingggg
  module Models
    class PetUpdatedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetUpdatedWebhookEvent,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[
            HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
          ]
        )
      end
      attr_accessor :changed_fields

      sig { returns(HelloWorldTestingggg::PetAPI) }
      attr_reader :pet

      sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
      attr_writer :pet

      sig do
        returns(
          HelloWorldTestingggg::PetUpdatedWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # pet status in the store
      sig { returns(T.nilable(HelloWorldTestingggg::PetStatus::TaggedSymbol)) }
      attr_accessor :previous_status

      sig do
        params(
          changed_fields:
            T::Array[
              HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::OrSymbol
            ],
          pet: HelloWorldTestingggg::PetAPI::OrHash,
          type: HelloWorldTestingggg::PetUpdatedWebhookEvent::Type::OrSymbol,
          metadata: T::Hash[Symbol, String],
          previous_status: T.nilable(HelloWorldTestingggg::PetStatus::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        changed_fields:,
        pet:,
        type:,
        metadata: nil,
        # pet status in the store
        previous_status: nil
      )
      end

      sig do
        override.returns(
          {
            changed_fields:
              T::Array[
                HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
              ],
            pet: HelloWorldTestingggg::PetAPI,
            type:
              HelloWorldTestingggg::PetUpdatedWebhookEvent::Type::TaggedSymbol,
            metadata: T::Hash[Symbol, String],
            previous_status:
              T.nilable(HelloWorldTestingggg::PetStatus::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      module ChangedField
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NAME =
          T.let(
            :name,
            HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
          )
        STATUS =
          T.let(
            :status,
            HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
          )
        CATEGORY =
          T.let(
            :category,
            HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
          )
        TAGS =
          T.let(
            :tags,
            HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::PetUpdatedWebhookEvent::ChangedField::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Type
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::PetUpdatedWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PET_UPDATED =
          T.let(
            :"pet.updated",
            HelloWorldTestingggg::PetUpdatedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::PetUpdatedWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
