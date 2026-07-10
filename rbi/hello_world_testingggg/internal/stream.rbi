# typed: strong

module HelloWorldTestingggg
  module Internal
    class Stream
      Message =
        type_member(:in) do
          { fixed: HelloWorldTestingggg::Internal::Util::ServerSentEvent }
        end
      Elem = type_member(:out)

      include HelloWorldTestingggg::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
