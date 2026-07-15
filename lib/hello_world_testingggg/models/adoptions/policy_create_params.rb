# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # @see HelloWorldTestingggg::Resources::Adoptions::Policies#create
      class PolicyCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute rules
        #
        #   @return [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]
        required :rules,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule] }

        # @!attribute escalation
        #
        #   @return [HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation, nil]
        optional :escalation, -> { HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation }

        # @!attribute fee_cap
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :fee_cap, -> { HelloWorldTestingggg::Money }, api_name: :feeCap

        # @!attribute notification_target
        #   Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @return [String, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink, nil]
        optional :notification_target,
                 union: -> { HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget },
                 api_name: :notificationTarget

        # @!attribute regional_overrides
        #
        #   @return [Hash{Symbol=>String, Integer, Float, Array<String>, Time}, nil]
        optional :regional_overrides,
                 -> {
                   HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]
                 },
                 api_name: :regionalOverrides

        # @!method initialize(name:, rules:, escalation: nil, fee_cap: nil, notification_target: nil, regional_overrides: nil, request_options: {})
        #   @param name [String]
        #
        #   @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]
        #
        #   @param escalation [HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation]
        #
        #   @param fee_cap [HelloWorldTestingggg::Models::Money]
        #
        #   @param notification_target [String, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink] Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @param regional_overrides [Hash{Symbol=>String, Integer, Float, Array<String>, Time}]
        #
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

        class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute operator
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation::Operator]
          required :operator, enum: -> { HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::Operator }

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
          #   @param operator [Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation::Operator]
          #
          #   @param groups [Array<Object>] Nested rule groups; groups can recurse arbitrarily deep.
          #
          #   @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]

          # @see HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation#operator
          module Operator
            extend HelloWorldTestingggg::Internal::Type::Enum

            ALL = :ALL
            ANY = :ANY

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        module NotificationTarget
          extend HelloWorldTestingggg::Internal::Type::Union

          # An email address to notify.
          variant String

          variant -> { HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink }

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute events
            #
            #   @return [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event>, nil]
            optional :events,
                     -> { HelloWorldTestingggg::Internal::Type::ArrayOf[enum: HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event] }

            request_only do
              # @!attribute secret
              #
              #   @return [String, nil]
              optional :secret, String
            end

            # @!method initialize(url:, events: nil, secret: nil)
            #   @param url [String]
            #   @param events [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::Event>]
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
          #   @return [Array(String, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink)]
        end
      end
    end
  end
end
