# typed: strong

module HelloWorldTestingggg
  module Models
    class AdoptionsPolicyChangedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(HelloWorldTestingggg::Adoptions::Policy) }
      attr_reader :policy

      sig do
        params(policy: HelloWorldTestingggg::Adoptions::Policy::OrHash).void
      end
      attr_writer :policy

      sig { returns(Symbol) }
      attr_accessor :type

      # Values before the change.
      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous
          )
        )
      end
      attr_reader :previous

      sig do
        params(
          previous:
            HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::OrHash
        ).void
      end
      attr_writer :previous

      sig do
        params(
          id: String,
          created_at: Time,
          policy: HelloWorldTestingggg::Adoptions::Policy::OrHash,
          previous:
            HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        policy:,
        # Values before the change.
        previous: nil,
        type: :"adoptions.policy.changed"
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            policy: HelloWorldTestingggg::Adoptions::Policy,
            type: Symbol,
            previous:
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous
          }
        )
      end
      def to_hash
      end

      class Previous < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::Variants
            )
          )
        end
        attr_reader :notification_target

        sig do
          params(
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::OrHash
              )
          ).void
        end
        attr_writer :notification_target

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::OrSymbol
          ).void
        end
        attr_writer :status

        # Values before the change.
        sig do
          params(
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::OrHash
              ),
            status:
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Where policy decisions are delivered: a plain email address or a webhook sink.
          notification_target: nil,
          status: nil
        )
        end

        sig do
          override.returns(
            {
              notification_target:
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::Variants,
              status:
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        module NotificationTarget
          extend HelloWorldTestingggg::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink
              )
            end

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :url

            sig do
              returns(
                T.nilable(
                  T::Array[
                    HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                  ]
                )
              )
            end
            attr_reader :events

            sig do
              params(
                events:
                  T::Array[
                    HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::OrSymbol
                  ]
              ).void
            end
            attr_writer :events

            sig do
              params(
                url: String,
                events:
                  T::Array[
                    HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::OrSymbol
                  ]
              ).returns(T.attached_class)
            end
            def self.new(url:, events: nil)
            end

            sig do
              override.returns(
                {
                  url: String,
                  events:
                    T::Array[
                      HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                    ],
                  secret: String
                }
              )
            end
            def to_hash
            end

            module Event
              extend HelloWorldTestingggg::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              APPROVED =
                T.let(
                  :approved,
                  HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              REJECTED =
                T.let(
                  :rejected,
                  HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              ESCALATED =
                T.let(
                  :escalated,
                  HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DRAFT =
            T.let(
              :draft,
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
            )
          ARCHIVED =
            T.let(
              :archived,
              HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status::TaggedSymbol
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
