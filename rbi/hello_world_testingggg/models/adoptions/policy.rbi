# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      class Policy < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Adoptions::Policy,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule]) }
        attr_accessor :rules

        sig do
          returns(HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig do
          returns(
            T.nilable(HelloWorldTestingggg::Adoptions::Policy::Escalation)
          )
        end
        attr_reader :escalation

        sig do
          params(
            escalation:
              HelloWorldTestingggg::Adoptions::Policy::Escalation::OrHash
          ).void
        end
        attr_writer :escalation

        sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
        attr_reader :fee_cap

        sig { params(fee_cap: HelloWorldTestingggg::Money::OrHash).void }
        attr_writer :fee_cap

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::Variants
            )
          )
        end
        attr_reader :notification_target

        sig do
          params(
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::OrHash
              )
          ).void
        end
        attr_writer :notification_target

        # Per-region override values keyed by region code.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                HelloWorldTestingggg::Adoptions::ConditionValue::Variants
              ]
            )
          )
        end
        attr_reader :regional_overrides

        sig do
          params(
            regional_overrides:
              T::Hash[
                Symbol,
                HelloWorldTestingggg::Adoptions::ConditionValue::Variants
              ]
          ).void
        end
        attr_writer :regional_overrides

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          params(
            id: String,
            created_at: Time,
            name: String,
            rules:
              T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash],
            status: HelloWorldTestingggg::Adoptions::Policy::Status::OrSymbol,
            escalation:
              HelloWorldTestingggg::Adoptions::Policy::Escalation::OrHash,
            fee_cap: HelloWorldTestingggg::Money::OrHash,
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::OrHash
              ),
            regional_overrides:
              T::Hash[
                Symbol,
                HelloWorldTestingggg::Adoptions::ConditionValue::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          name:,
          rules:,
          status:,
          escalation: nil,
          fee_cap: nil,
          # Where policy decisions are delivered: a plain email address or a webhook sink.
          notification_target: nil,
          # Per-region override values keyed by region code.
          regional_overrides: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              name: String,
              rules: T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule],
              status:
                HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol,
              escalation: HelloWorldTestingggg::Adoptions::Policy::Escalation,
              fee_cap: HelloWorldTestingggg::Money,
              notification_target:
                HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::Variants,
              regional_overrides:
                T::Hash[
                  Symbol,
                  HelloWorldTestingggg::Adoptions::ConditionValue::Variants
                ]
            }
          )
        end
        def to_hash
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, HelloWorldTestingggg::Adoptions::Policy::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DRAFT =
            T.let(
              :draft,
              HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol
            )
          ARCHIVED =
            T.let(
              :archived,
              HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Adoptions::Policy::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Adoptions::Policy::Escalation,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::TaggedSymbol
            )
          end
          attr_accessor :operator

          # Nested rule groups; groups can recurse arbitrarily deep.
          sig { returns(T.nilable(T::Array[T.anything])) }
          attr_reader :groups

          sig { params(groups: T::Array[T.anything]).void }
          attr_writer :groups

          sig do
            returns(
              T.nilable(T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule])
            )
          end
          attr_reader :rules

          sig do
            params(
              rules:
                T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash]
            ).void
          end
          attr_writer :rules

          sig do
            params(
              operator:
                HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::OrSymbol,
              groups: T::Array[T.anything],
              rules:
                T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash]
            ).returns(T.attached_class)
          end
          def self.new(
            operator:,
            # Nested rule groups; groups can recurse arbitrarily deep.
            groups: nil,
            rules: nil
          )
          end

          sig do
            override.returns(
              {
                operator:
                  HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::TaggedSymbol,
                groups: T::Array[T.anything],
                rules: T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule]
              }
            )
          end
          def to_hash
          end

          module Operator
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :ALL,
                HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::TaggedSymbol
              )
            ANY =
              T.let(
                :ANY,
                HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        module NotificationTarget
          extend HelloWorldTestingggg::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink
              )
            end

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :url

            sig do
              returns(
                T.nilable(
                  T::Array[
                    HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
                  ]
                )
              )
            end
            attr_reader :events

            sig do
              params(
                events:
                  T::Array[
                    HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::OrSymbol
                  ]
              ).void
            end
            attr_writer :events

            sig do
              params(
                url: String,
                events:
                  T::Array[
                    HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::OrSymbol
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
                      HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
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
                    HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              APPROVED =
                T.let(
                  :approved,
                  HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              REJECTED =
                T.let(
                  :rejected,
                  HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              ESCALATED =
                T.let(
                  :escalated,
                  HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event::TaggedSymbol
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
                HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
