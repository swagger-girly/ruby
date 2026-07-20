# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::WebhooksTest < HelloWorldTestingggg::Test::ResourceTest
  def test_parsed
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"pet\":{\"name\":\"doggie\",\"photoUrls\":[\"string\"],\"id\":10,\"acquisitionChannel\":\"breeder\",\"category\":{\"id\":1,\"name\":\"Dogs\",\"subcategories\":[]},\"microchipId\":\"string\",\"status\":\"available\",\"tags\":[{\"id\":0,\"name\":\"name\"}]},\"type\":\"pet.created\"}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @hello_world_testingggg.webhooks.parsed(data, headers: headers, key: key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @hello_world_testingggg.webhooks.parsed(data, headers: bad_header, key: key)
      end
    end
  end
end
