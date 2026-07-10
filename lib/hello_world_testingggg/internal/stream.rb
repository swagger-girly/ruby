# frozen_string_literal: true

module HelloWorldTestingggg
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |event|
    #     puts(event)
    #   end
    class Stream
      include HelloWorldTestingggg::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        # rubocop:disable Metrics/BlockLength
        @iterator ||= HelloWorldTestingggg::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do |msg|
            case msg
            in {event: "bookmark"}
              next
            in {event: "error", data: String => data}
              decoded = Kernel.then do
                JSON.parse(data, symbolize_names: true)
              rescue JSON::ParserError
                data
              end
              err = HelloWorldTestingggg::Errors::APIStatusError.for(
                url: @url,
                status: @status,
                headers: @headers,
                body: decoded,
                request: nil,
                response: @response
              )
              raise err
            in {event: "status", data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = HelloWorldTestingggg::Internal::Util.dig(decoded, @unwrap)
              y << HelloWorldTestingggg::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
        # rubocop:enable Metrics/BlockLength
      end
    end
  end
end
