# frozen_string_literal: true

module HelloWorldTestingggg
  module Internal
    # @generic Elem
    #
    # @example
    #   if x_fake_single_page.has_next?
    #     x_fake_single_page = x_fake_single_page.next_page
    #   end
    #
    # @example
    #   x_fake_single_page.auto_paging_each do |pet|
    #     puts(pet)
    #   end
    class XFakeSinglePage
      include HelloWorldTestingggg::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [Boolean]
      attr_accessor :has_more

      # @return [Boolean]
      def next_page?
        has_more
      end

      # @raise [HelloWorldTestingggg::HTTP::Error]
      # @return [self]
      def next_page
        RuntimeError.new("No more pages available.")
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Array<Object>]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Array => data}
          @data = data.map { HelloWorldTestingggg::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @has_more = page_data[:has_more]
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = HelloWorldTestingggg::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} has_more=#{has_more.inspect}>"
      end
    end
  end
end
