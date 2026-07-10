# typed: strong

module HelloWorldTestingggg
  module Resources
    class Webhooks
      sig do
        params(
          payload: String,
          headers: T::Hash[String, String],
          key: T.nilable(String)
        ).returns(
          T.any(
            HelloWorldTestingggg::PetCreatedWebhookEvent,
            HelloWorldTestingggg::PetUpdatedWebhookEvent,
            HelloWorldTestingggg::PetInventoryLowWebhookEvent,
            HelloWorldTestingggg::ParsedWebhookEvent::PetModerationApprovedEvent,
            HelloWorldTestingggg::ParsedWebhookEvent::PetModerationRejectedEvent,
            HelloWorldTestingggg::StoreReportGeneratedWebhookEvent
          )
        )
      end
      def parsed(
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
