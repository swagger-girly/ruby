# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      class PolicyCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Adoptions::PolicyCreateParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule]) }
        attr_accessor :rules

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation
            )
          )
        end
        attr_reader :escalation

        sig do
          params(
            escalation:
              HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::OrHash
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
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink
              )
            )
          )
        end
        attr_reader :notification_target

        sig do
          params(
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::OrHash
              )
          ).void
        end
        attr_writer :notification_target

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

        sig do
          params(
            name: String,
            rules:
              T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash],
            escalation:
              HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::OrHash,
            fee_cap: HelloWorldTestingggg::Money::OrHash,
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::OrHash
              ),
            regional_overrides:
              T::Hash[
                Symbol,
                HelloWorldTestingggg::Adoptions::ConditionValue::Variants
              ],
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          name:,
          rules:,
          escalation: nil,
          fee_cap: nil,
          # Where policy decisions are delivered: a plain email address or a webhook sink.
          notification_target: nil,
          regional_overrides: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              rules: T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule],
              escalation:
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation,
              fee_cap: HelloWorldTestingggg::Money,
              notification_target:
                T.any(
                  String,
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink
                ),
              regional_overrides:
                T::Hash[
                  Symbol,
                  HelloWorldTestingggg::Adoptions::ConditionValue::Variants
                ],
              request_options: HelloWorldTestingggg::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::OrSymbol
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
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::OrSymbol,
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
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::OrSymbol,
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
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :ALL,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::TaggedSymbol
              )
            ANY =
              T.let(
                :ANY,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator::TaggedSymbol
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
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink
              )
            end

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :url

            sig do
              returns(
                T.nilable(
                  T::Array[
                    HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::OrSymbol
                  ]
                )
              )
            end
            attr_reader :events

            sig do
              params(
                events:
                  T::Array[
                    HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::OrSymbol
                  ]
              ).void
            end
            attr_writer :events

            sig { returns(T.nilable(String)) }
            attr_reader :secret

            sig { params(secret: String).void }
            attr_writer :secret

            sig do
              params(
                url: String,
                events:
                  T::Array[
                    HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::OrSymbol
                  ],
                secret: String
              ).returns(T.attached_class)
            end
            def self.new(url:, events: nil, secret: nil)
            end

            sig do
              override.returns(
                {
                  url: String,
                  events:
                    T::Array[
                      HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::OrSymbol
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
                    HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              APPROVED =
                T.let(
                  :approved,
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              REJECTED =
                T.let(
                  :rejected,
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )
              ESCALATED =
                T.let(
                  :escalated,
                  HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event::TaggedSymbol
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
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::Variants
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
