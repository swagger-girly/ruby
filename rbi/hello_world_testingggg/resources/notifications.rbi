# typed: strong

module HelloWorldTestingggg
  module Resources
    class Notifications
      sig { returns(HelloWorldTestingggg::Resources::Notifications::Webhooks) }
      attr_reader :webhooks

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
