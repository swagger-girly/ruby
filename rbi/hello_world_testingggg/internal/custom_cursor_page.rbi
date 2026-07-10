# typed: strong

module HelloWorldTestingggg
  module Internal
    class CustomCursorPage
      include HelloWorldTestingggg::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
