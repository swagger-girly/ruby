# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # @see HelloWorldTestingggg::Resources::Adoptions::Policies#update
      class PolicyUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute policy_id
        #
        #   @return [String]
        required :policy_id, String

        # @!attribute body
        #
        #   @return [HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate]
        required :body, union: -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body }

        # @!method initialize(policy_id:, body:, request_options: {})
        #   @param policy_id [String]
        #   @param body [HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate]
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

        module Body
          extend HelloWorldTestingggg::Internal::Type::Union

          variant -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate }

          variant -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate }

          class AdoptionPolicyDetailsUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute escalation
            #
            #   @return [HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation, nil]
            optional :escalation,
                     -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation }

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!attribute notification_target
            #   Where policy decisions are delivered: a plain email address or a webhook sink.
            #
            #   @return [String, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink, nil]
            optional :notification_target,
                     union: -> {
                       HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget
                     },
                     api_name: :notificationTarget

            # @!method initialize(escalation: nil, name: nil, notification_target: nil)
            #   @param escalation [HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation]
            #
            #   @param name [String]
            #
            #   @param notification_target [String, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink] Where policy decisions are delivered: a plain email address or a webhook sink.

            # @see HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate#escalation
            class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute operator
              #
              #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator]
              required :operator,
                       enum: -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator }

              # @!attribute groups
              #   Nested rule groups; groups can recurse arbitrarily deep.
              #
              #   @return [Array<Object>, nil]
              optional :groups,
                       HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Internal::Type::Unknown]

              # @!attribute rules
              #
              #   @return [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>, nil]
              optional :rules,
                       -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule] }

              # @!method initialize(operator:, groups: nil, rules: nil)
              #   @param operator [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation::Operator]
              #
              #   @param groups [Array<Object>] Nested rule groups; groups can recurse arbitrarily deep.
              #
              #   @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]

              # @see HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::Escalation#operator
              module Operator
                extend HelloWorldTestingggg::Internal::Type::Enum

                ALL = :ALL
                ANY = :ANY

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Where policy decisions are delivered: a plain email address or a webhook sink.
            #
            # @see HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate#notification_target
            module NotificationTarget
              extend HelloWorldTestingggg::Internal::Type::Union

              # An email address to notify.
              variant String

              variant -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink }

              class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute events
                #
                #   @return [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event>, nil]
                optional :events,
                         -> do
                           HelloWorldTestingggg::Internal::Type::ArrayOf[
                             enum: HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event
                           ]
                         end

                request_only do
                  # @!attribute secret
                  #
                  #   @return [String, nil]
                  optional :secret, String
                end

                # @!method initialize(url:, events: nil, secret: nil)
                #   @param url [String]
                #   @param events [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink::Event>]
                #   @param secret [String]

                module Event
                  extend HelloWorldTestingggg::Internal::Type::Enum

                  APPROVED = :approved
                  REJECTED = :rejected
                  ESCALATED = :escalated

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @!method self.variants
              #   @return [Array(String, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::NotificationTarget::WebhookSink)]
            end
          end

          class AdoptionPolicyLifecycleUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute actor
            #
            #   @return [String]
            required :actor, String

            # @!attribute status
            #
            #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status]
            required :status,
                     enum: -> { HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status }

            # @!attribute acted_at
            #
            #   @return [Time, nil]
            optional :acted_at, Time, api_name: :actedAt

            # @!attribute reason
            #
            #   @return [String, nil]
            optional :reason, String

            # @!method initialize(actor:, status:, acted_at: nil, reason: nil)
            #   @param actor [String]
            #   @param status [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::Status]
            #   @param acted_at [Time]
            #   @param reason [String]

            # @see HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate#status
            module Status
              extend HelloWorldTestingggg::Internal::Type::Enum

              ACTIVE = :active
              ARCHIVED = :archived

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate)]
        end
      end
    end
  end
end
