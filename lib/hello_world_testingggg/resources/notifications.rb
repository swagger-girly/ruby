# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Notifications
      # @return [HelloWorldTestingggg::Resources::Notifications::Webhooks]
      attr_reader :webhooks

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
        @webhooks = HelloWorldTestingggg::Resources::Notifications::Webhooks.new(client: client)
      end
    end
  end
end
