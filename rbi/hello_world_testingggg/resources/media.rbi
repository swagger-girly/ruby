# typed: strong

module HelloWorldTestingggg
  module Resources
    class Media
      # A binary body alongside a JSON media type.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaBinaryAndJsonResponse)
      end
      def binary_and_json(request_options: {})
      end

      # JSON alongside an XML media type.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaJsonAndXmlResponse)
      end
      def json_and_xml(request_options: {})
      end

      # JSON listed before a text media type.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaJsonFirstResponse)
      end
      def json_first(request_options: {})
      end

      # Schema present on application/json but absent on a text/plain listed first.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaSchemaOnJsonResponse)
      end
      def schema_on_json(request_options: {})
      end

      # Schema present on text/plain but absent on application/json.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def schema_on_text(request_options: {})
      end

      # Text media type listed before JSON (both with a schema).
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaTextFirstResponse)
      end
      def text_first(request_options: {})
      end

      # A single text/plain body.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(String)
      end
      def text_only(request_options: {})
      end

      # A vendor application/vnd.pet.v2+json media type.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::MediaVendorJsonResponse)
      end
      def vendor_json(request_options: {})
      end

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
