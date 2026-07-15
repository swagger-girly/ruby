# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      class PolicyUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Adoptions::PolicyUpdateParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :policy_id

        sig do
          returns(
            T.any(
              HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate,
              HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate
            )
          )
        end
        attr_accessor :body

        sig do
          params(
            policy_id: String,
            body:
              T.any(
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::OrHash,
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::OrHash
              ),
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(policy_id:, body:, request_options: {})
        end

        sig do
          override.returns(
            {
              policy_id: String,
              body:
                T.any(
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate,
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate
                ),
              request_options: HelloWorldTestingggg::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Body
          extend HelloWorldTestingggg::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate,
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate
              )
            end

          class AdoptionPolicyDetailsUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation
                )
              )
            end
            attr_reader :escalation

            sig do
              params(
                escalation:
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::OrHash
              ).void
            end
            attr_writer :escalation

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            # Where policy decisions are delivered: a plain email address or a webhook sink.
            sig do
              returns(
                T.nilable(
                  T.any(
                    String,
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink
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
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::OrHash
                  )
              ).void
            end
            attr_writer :notification_target

            sig do
              params(
                escalation:
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::OrHash,
                name: String,
                notification_target:
                  T.any(
                    String,
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              escalation: nil,
              name: nil,
              # Where policy decisions are delivered: a plain email address or a webhook sink.
              notification_target: nil
            )
            end

            sig do
              override.returns(
                {
                  escalation:
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation,
                  name: String,
                  notification_target:
                    T.any(
                      String,
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink
                    )
                }
              )
            end
            def to_hash
            end

            class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::OrSymbol
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
                  T.nilable(
                    T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule]
                  )
                )
              end
              attr_reader :rules

              sig do
                params(
                  rules:
                    T::Array[
                      HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash
                    ]
                ).void
              end
              attr_writer :rules

              sig do
                params(
                  operator:
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::OrSymbol,
                  groups: T::Array[T.anything],
                  rules:
                    T::Array[
                      HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash
                    ]
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
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::OrSymbol,
                    groups: T::Array[T.anything],
                    rules:
                      T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule]
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
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ALL =
                  T.let(
                    :ALL,
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::TaggedSymbol
                  )
                ANY =
                  T.let(
                    :ANY,
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator::TaggedSymbol
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
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink
                  )
                end

              class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink,
                      HelloWorldTestingggg::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :url

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :events

                sig do
                  params(
                    events:
                      T::Array[
                        HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::OrSymbol
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
                        HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::OrSymbol
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
                          HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::OrSymbol
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
                        HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  APPROVED =
                    T.let(
                      :approved,
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::TaggedSymbol
                    )
                  REJECTED =
                    T.let(
                      :rejected,
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::TaggedSymbol
                    )
                  ESCALATED =
                    T.let(
                      :escalated,
                      HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event::TaggedSymbol
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
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::Variants
                  ]
                )
              end
              def self.variants
              end
            end
          end

          class AdoptionPolicyLifecycleUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :actor

            sig do
              returns(
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::OrSymbol
              )
            end
            attr_accessor :status

            sig { returns(T.nilable(Time)) }
            attr_reader :acted_at

            sig { params(acted_at: Time).void }
            attr_writer :acted_at

            sig { returns(T.nilable(String)) }
            attr_reader :reason

            sig { params(reason: String).void }
            attr_writer :reason

            sig do
              params(
                actor: String,
                status:
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::OrSymbol,
                acted_at: Time,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(actor:, status:, acted_at: nil, reason: nil)
            end

            sig do
              override.returns(
                {
                  actor: String,
                  status:
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::OrSymbol,
                  acted_at: Time,
                  reason: String
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
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTIVE =
                T.let(
                  :active,
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::TaggedSymbol
                )
              ARCHIVED =
                T.let(
                  :archived,
                  HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status::TaggedSymbol
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
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::Variants
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
