# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Notifications
      class Webhooks
        # @param payload [String] The raw webhook payload as a string
        #
        # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
        #
        # @param key [String, nil] The webhook signing key
        #
        # @return [HelloWorldTestingggg::Models::Notifications::PetCreatedWebhookEvent, HelloWorldTestingggg::Models::Notifications::PetUpdatedWebhookEvent, HelloWorldTestingggg::Models::Notifications::PetInventoryLowWebhookEvent, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationApprovedEvent, HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent::PetModerationRejectedEvent]
        def parse_pet(payload, headers:, key: @client.webhook_secret)
          if key.nil?
            raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument")
          end

          ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

          parsed = JSON.parse(payload, symbolize_names: true)
          HelloWorldTestingggg::Internal::Type::Converter.coerce(HelloWorldTestingggg::Models::Notifications::ParsePetWebhookEvent, parsed)
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
end
