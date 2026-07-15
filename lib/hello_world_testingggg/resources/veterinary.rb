# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Veterinary
      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
