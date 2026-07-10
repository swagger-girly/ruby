# typed: strong

module HelloWorldTestingggg
  module Internal
    class ReportCursorPage
      include HelloWorldTestingggg::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
