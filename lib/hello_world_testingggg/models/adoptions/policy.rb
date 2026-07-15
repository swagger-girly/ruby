# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # @see HelloWorldTestingggg::Resources::Adoptions::Policies#create
      class Policy < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute rules
        #
        #   @return [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]
        required :rules,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule] }

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::Status]
        required :status, enum: -> { HelloWorldTestingggg::Adoptions::Policy::Status }

        # @!attribute escalation
        #
        #   @return [HelloWorldTestingggg::Models::Adoptions::Policy::Escalation, nil]
        optional :escalation, -> { HelloWorldTestingggg::Adoptions::Policy::Escalation }

        # @!attribute fee_cap
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :fee_cap, -> { HelloWorldTestingggg::Money }, api_name: :feeCap

        # @!attribute notification_target
        #   Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @return [String, HelloWorldTestingggg::Models::Adoptions::Policy::NotificationTarget::WebhookSink, nil]
        optional :notification_target,
                 union: -> { HelloWorldTestingggg::Adoptions::Policy::NotificationTarget },
                 api_name: :notificationTarget

        # @!attribute regional_overrides
        #   Per-region override values keyed by region code.
        #
        #   @return [Hash{Symbol=>String, Integer, Float, Array<String>, Time}, nil]
        optional :regional_overrides,
                 -> {
                   HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]
                 },
                 api_name: :regionalOverrides

        response_only do
          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt
        end

        # @!method initialize(id:, created_at:, name:, rules:, status:, escalation: nil, fee_cap: nil, notification_target: nil, regional_overrides: nil)
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param name [String]
        #
        #   @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]
        #
        #   @param status [Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::Status]
        #
        #   @param escalation [HelloWorldTestingggg::Models::Adoptions::Policy::Escalation]
        #
        #   @param fee_cap [HelloWorldTestingggg::Models::Money]
        #
        #   @param notification_target [String, HelloWorldTestingggg::Models::Adoptions::Policy::NotificationTarget::WebhookSink] Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @param regional_overrides [Hash{Symbol=>String, Integer, Float, Array<String>, Time}] Per-region override values keyed by region code.

        # @see HelloWorldTestingggg::Models::Adoptions::Policy#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          DRAFT = :draft
          ACTIVE = :active
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::Adoptions::Policy#escalation
        class Escalation < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute operator
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::Escalation::Operator]
          required :operator, enum: -> { HelloWorldTestingggg::Adoptions::Policy::Escalation::Operator }

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
          #   @param operator [Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::Escalation::Operator]
          #
          #   @param groups [Array<Object>] Nested rule groups; groups can recurse arbitrarily deep.
          #
          #   @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]

          # @see HelloWorldTestingggg::Models::Adoptions::Policy::Escalation#operator
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
        # @see HelloWorldTestingggg::Models::Adoptions::Policy#notification_target
        module NotificationTarget
          extend HelloWorldTestingggg::Internal::Type::Union

          # An email address to notify.
          variant String

          variant -> { HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink }

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute events
            #
            #   @return [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::NotificationTarget::WebhookSink::Event>, nil]
            optional :events,
                     -> { HelloWorldTestingggg::Internal::Type::ArrayOf[enum: HelloWorldTestingggg::Adoptions::Policy::NotificationTarget::WebhookSink::Event] }

            # @!method initialize(url:, events: nil)
            #   @param url [String]
            #   @param events [Array<Symbol, HelloWorldTestingggg::Models::Adoptions::Policy::NotificationTarget::WebhookSink::Event>]

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
          #   @return [Array(String, HelloWorldTestingggg::Models::Adoptions::Policy::NotificationTarget::WebhookSink)]
        end
      end
    end
  end
end
