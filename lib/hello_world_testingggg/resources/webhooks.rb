# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key
      #
      # @return [HelloWorldTestingggg::Models::PetCreatedWebhookEvent, HelloWorldTestingggg::Models::PetUpdatedWebhookEvent, HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent, HelloWorldTestingggg::Models::ParsedWebhookEvent::PetModerationApprovedEvent, HelloWorldTestingggg::Models::ParsedWebhookEvent::PetModerationRejectedEvent, HelloWorldTestingggg::Models::StoreReportGeneratedWebhookEvent]
      def parsed(payload, headers:, key: @client.webhook_secret)
        if key.nil?
          raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument")
        end

        ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

        parsed = JSON.parse(payload, symbolize_names: true)
        HelloWorldTestingggg::Internal::Type::Converter.coerce(HelloWorldTestingggg::Models::ParsedWebhookEvent, parsed)
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
