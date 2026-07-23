# typed: strong

module HelloWorldTestingggg
  module Models
    module Notifications
      module ParsePetWebhookEvent
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent,
              HelloWorldTestingggg::Notifications::PetUpdatedWebhookEvent,
              HelloWorldTestingggg::Notifications::PetInventoryLowWebhookEvent,
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent,
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent
            )
          end

        class PetModerationApprovedEvent < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Time) }
          attr_accessor :approved_at

          sig { returns(HelloWorldTestingggg::PetAPI) }
          attr_reader :pet

          sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
          attr_writer :pet

          sig do
            returns(
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              approved_at: Time,
              pet: HelloWorldTestingggg::PetAPI::OrHash,
              type:
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(approved_at:, pet:, type:)
          end

          sig do
            override.returns(
              {
                approved_at: Time,
                pet: HelloWorldTestingggg::PetAPI,
                type:
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type::TaggedSymbol
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
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PET_MODERATION_APPROVED =
              T.let(
                :"pet.moderation.approved",
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class PetModerationRejectedEvent < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(HelloWorldTestingggg::PetAPI) }
          attr_reader :pet

          sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
          attr_writer :pet

          sig do
            returns(
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          sig do
            returns(
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote
                ]
              )
            )
          end
          attr_reader :review_notes

          sig do
            params(
              review_notes:
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::OrHash
                ]
            ).void
          end
          attr_writer :review_notes

          sig do
            params(
              pet: HelloWorldTestingggg::PetAPI::OrHash,
              reason:
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::OrSymbol,
              type:
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type::OrSymbol,
              review_notes:
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(pet:, reason:, type:, review_notes: nil)
          end

          sig do
            override.returns(
              {
                pet: HelloWorldTestingggg::PetAPI,
                reason:
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol,
                type:
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type::TaggedSymbol,
                review_notes:
                  T::Array[
                    HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote
                  ]
              }
            )
          end
          def to_hash
          end

          module Reason
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            POLICY_VIOLATION =
              T.let(
                :policy_violation,
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol
              )
            DUPLICATE =
              T.let(
                :duplicate,
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol
              )
            UNSAFE_CONTENT =
              T.let(
                :"unsafe-content",
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Reason::TaggedSymbol
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
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PET_MODERATION_REJECTED =
              T.let(
                :"pet.moderation.rejected",
                HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class ReviewNote < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :message

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer
                )
              )
            end
            attr_reader :reviewer

            sig do
              params(
                reviewer:
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer::OrHash
              ).void
            end
            attr_writer :reviewer

            sig do
              params(
                message: String,
                reviewer:
                  HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer::OrHash
              ).returns(T.attached_class)
            end
            def self.new(message:, reviewer: nil)
            end

            sig do
              override.returns(
                {
                  message: String,
                  reviewer:
                    HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer
                }
              )
            end
            def to_hash
            end

            class Reviewer < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent::ReviewNote::Reviewer,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(Integer)) }
              attr_reader :id

              sig { params(id: Integer).void }
              attr_writer :id

              sig { returns(T.nilable(String)) }
              attr_reader :email

              sig { params(email: String).void }
              attr_writer :email

              sig { returns(T.nilable(String)) }
              attr_reader :first_name

              sig { params(first_name: String).void }
              attr_writer :first_name

              sig { returns(T.nilable(String)) }
              attr_reader :last_name

              sig { params(last_name: String).void }
              attr_writer :last_name

              sig { returns(T.nilable(String)) }
              attr_reader :password

              sig { params(password: String).void }
              attr_writer :password

              sig { returns(T.nilable(String)) }
              attr_reader :phone

              sig { params(phone: String).void }
              attr_writer :phone

              sig { returns(T.nilable(String)) }
              attr_reader :username

              sig { params(username: String).void }
              attr_writer :username

              # User Status
              sig { returns(T.nilable(Integer)) }
              attr_reader :user_status

              sig { params(user_status: Integer).void }
              attr_writer :user_status

              sig do
                params(
                  id: Integer,
                  email: String,
                  first_name: String,
                  last_name: String,
                  password: String,
                  phone: String,
                  username: String,
                  user_status: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                id: nil,
                email: nil,
                first_name: nil,
                last_name: nil,
                password: nil,
                phone: nil,
                username: nil,
                # User Status
                user_status: nil
              )
              end

              sig do
                override.returns(
                  {
                    id: Integer,
                    email: String,
                    first_name: String,
                    last_name: String,
                    password: String,
                    phone: String,
                    username: String,
                    user_status: Integer
                  }
                )
              end
              def to_hash
              end
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
