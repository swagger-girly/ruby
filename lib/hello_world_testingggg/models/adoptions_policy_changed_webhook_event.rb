# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class AdoptionsPolicyChangedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute policy
      #
      #   @return [HelloWorldTestingggg::Models::Adoptions::Policy]
      required :policy, -> { HelloWorldTestingggg::Adoptions::Policy }

      # @!attribute type
      #
      #   @return [Symbol, :"adoptions.policy.changed"]
      required :type, const: :"adoptions.policy.changed"

      # @!attribute previous
      #   Values before the change.
      #
      #   @return [HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous, nil]
      optional :previous, -> { HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous }

      # @!method initialize(id:, created_at:, policy:, previous: nil, type: :"adoptions.policy.changed")
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param policy [HelloWorldTestingggg::Models::Adoptions::Policy]
      #
      #   @param previous [HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous] Values before the change.
      #
      #   @param type [Symbol, :"adoptions.policy.changed"]

      # @see HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent#previous
      class Previous < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute notification_target
        #   Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @return [String, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink, nil]
        optional :notification_target,
                 union: -> {
                   HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget
                 },
                 api_name: :notificationTarget

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::Status, nil]
        optional :status, enum: -> { HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::Status }

        # @!method initialize(notification_target: nil, status: nil)
        #   Values before the change.
        #
        #   @param notification_target [String, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink] Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        #   @param status [Symbol, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::Status]

        # Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        # @see HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous#notification_target
        module NotificationTarget
          extend HelloWorldTestingggg::Internal::Type::Union

          # An email address to notify.
          variant String

          variant -> { HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink }

          class WebhookSink < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute events
            #
            #   @return [Array<Symbol, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event>, nil]
            optional :events,
                     -> do
                       HelloWorldTestingggg::Internal::Type::ArrayOf[
                         enum: HelloWorldTestingggg::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event
                       ]
                     end

            # @!method initialize(url:, events: nil)
            #   @param url [String]
            #   @param events [Array<Symbol, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink::Event>]

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
          #   @return [Array(String, HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous::NotificationTarget::WebhookSink)]
        end

        # @see HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent::Previous#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          DRAFT = :draft
          ACTIVE = :active
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
