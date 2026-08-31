# typed: strong

module HelloWorldTestingggg
  module Resources
    class Notifications
      class Webhooks
        sig do
          params(
            payload: String,
            headers: T::Hash[String, String],
            key: T.nilable(String)
          ).returns(
            T.any(
              HelloWorldTestingggg::Notifications::PetCreatedWebhookEvent,
              HelloWorldTestingggg::Notifications::PetUpdatedWebhookEvent,
              HelloWorldTestingggg::Notifications::PetInventoryLowWebhookEvent,
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent,
              HelloWorldTestingggg::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent
            )
          )
        end
        def parse_pet(
          # The raw webhook payload as a string
          payload,
          # The raw HTTP headers that came with the payload
          headers:,
          # The webhook signing key
          key: @client.webhook_secret
        )
        end

        # @api private
        sig do
          params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
