# typed: strong

module HelloWorldTestingggg
  module Resources
    class Veterinary
      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
