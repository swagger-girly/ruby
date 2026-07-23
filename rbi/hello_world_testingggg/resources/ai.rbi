# typed: strong

module HelloWorldTestingggg
  module Resources
    class AI
      # Casing probe replicating context.dev: glued AIAI prefix (resource ai + method
      # ai_query) over plural and non-plural synthesized element mints
      sig do
        params(
          data_to_extract:
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::OrHash
            ],
          domain: String,
          authentication_3ds:
            HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::OrHash,
          datapoint_object_schema:
            T::Hash[
              Symbol,
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::OrSymbol
            ],
          extraction_rules:
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::OrHash
            ],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::AIAIQueryResponse)
      end
      def ai_query(
        # Non-plural array property: singularization is a no-op (decisive probe)
        data_to_extract:,
        # The domain name to analyze
        domain:,
        # Digit-seam acronym parent for nested element mints
        authentication_3ds: nil,
        # Non-plural map property with enum values (map-mint probe)
        datapoint_object_schema: nil,
        # Plural array property: singularized element mint (control probe)
        extraction_rules: nil,
        request_options: {}
      )
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
