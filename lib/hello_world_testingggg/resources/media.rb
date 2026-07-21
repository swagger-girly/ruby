# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Media
      # A binary body alongside a JSON media type.
      #
      # @overload binary_and_json(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaBinaryAndJsonResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaBinaryAndJsonParams
      def binary_and_json(params = {})
        @client.request(
          method: :get,
          path: "media/binary-and-json",
          model: HelloWorldTestingggg::Models::MediaBinaryAndJsonResponse,
          options: params[:request_options]
        )
      end

      # JSON alongside an XML media type.
      #
      # @overload json_and_xml(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaJsonAndXmlResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaJsonAndXmlParams
      def json_and_xml(params = {})
        @client.request(
          method: :get,
          path: "media/json-and-xml",
          model: HelloWorldTestingggg::Models::MediaJsonAndXmlResponse,
          options: params[:request_options]
        )
      end

      # JSON listed before a text media type.
      #
      # @overload json_first(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaJsonFirstResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaJsonFirstParams
      def json_first(params = {})
        @client.request(
          method: :get,
          path: "media/json-first",
          model: HelloWorldTestingggg::Models::MediaJsonFirstResponse,
          options: params[:request_options]
        )
      end

      # Schema present on application/json but absent on a text/plain listed first.
      #
      # @overload schema_on_json(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaSchemaOnJsonResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaSchemaOnJsonParams
      def schema_on_json(params = {})
        @client.request(
          method: :get,
          path: "media/schema-on-json",
          model: HelloWorldTestingggg::Models::MediaSchemaOnJsonResponse,
          options: params[:request_options]
        )
      end

      # Schema present on text/plain but absent on application/json.
      #
      # @overload schema_on_text(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::MediaSchemaOnTextParams
      def schema_on_text(params = {})
        @client.request(
          method: :get,
          path: "media/schema-on-text",
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Text media type listed before JSON (both with a schema).
      #
      # @overload text_first(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaTextFirstResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaTextFirstParams
      def text_first(params = {})
        @client.request(
          method: :get,
          path: "media/text-first",
          model: HelloWorldTestingggg::Models::MediaTextFirstResponse,
          options: params[:request_options]
        )
      end

      # A single text/plain body.
      #
      # @overload text_only(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see HelloWorldTestingggg::Models::MediaTextOnlyParams
      def text_only(params = {})
        @client.request(
          method: :get,
          path: "media/text-only",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
        )
      end

      # A vendor application/vnd.pet.v2+json media type.
      #
      # @overload vendor_json(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::MediaVendorJsonResponse]
      #
      # @see HelloWorldTestingggg::Models::MediaVendorJsonParams
      def vendor_json(params = {})
        @client.request(
          method: :get,
          path: "media/vendor-json",
          headers: {"accept" => "application/vnd.pet.v2+json"},
          model: HelloWorldTestingggg::Models::MediaVendorJsonResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
