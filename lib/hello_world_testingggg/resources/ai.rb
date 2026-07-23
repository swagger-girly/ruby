# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class AI
      # Casing probe replicating context.dev: glued AIAI prefix (resource ai + method
      # ai_query) over plural and non-plural synthesized element mints
      #
      # @overload ai_query(data_to_extract:, domain:, authentication_3ds: nil, datapoint_object_schema: nil, extraction_rules: nil, request_options: {})
      #
      # @param data_to_extract [Array<HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract>] Non-plural array property: singularization is a no-op (decisive probe)
      #
      # @param domain [String] The domain name to analyze
      #
      # @param authentication_3ds [HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS] Digit-seam acronym parent for nested element mints
      #
      # @param datapoint_object_schema [Hash{Symbol=>Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::DatapointObjectSchema}] Non-plural map property with enum values (map-mint probe)
      #
      # @param extraction_rules [Array<HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule>] Plural array property: singularized element mint (control probe)
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::AIAIQueryResponse]
      #
      # @see HelloWorldTestingggg::Models::AIAIQueryParams
      def ai_query(params)
        parsed, options = HelloWorldTestingggg::AIAIQueryParams.dump_request(params)
        @client.request(
          method: :post,
          path: "ai/query",
          body: parsed,
          model: HelloWorldTestingggg::Models::AIAIQueryResponse,
          options: options
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
