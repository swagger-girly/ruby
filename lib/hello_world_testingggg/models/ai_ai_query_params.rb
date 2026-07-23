# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::AI#ai_query
    class AIAIQueryParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute data_to_extract
      #   Non-plural array property: singularization is a no-op (decisive probe)
      #
      #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract>]
      required :data_to_extract,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::AIAIQueryParams::DataToExtract] }

      # @!attribute domain
      #   The domain name to analyze
      #
      #   @return [String]
      required :domain, String

      # @!attribute authentication_3ds
      #   Digit-seam acronym parent for nested element mints
      #
      #   @return [HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS, nil]
      optional :authentication_3ds, -> { HelloWorldTestingggg::AIAIQueryParams::Authentication3DS }

      # @!attribute datapoint_object_schema
      #   Non-plural map property with enum values (map-mint probe)
      #
      #   @return [Hash{Symbol=>Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::DatapointObjectSchema}, nil]
      optional :datapoint_object_schema,
               -> { HelloWorldTestingggg::Internal::Type::HashOf[enum: HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema] }

      # @!attribute extraction_rules
      #   Plural array property: singularized element mint (control probe)
      #
      #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule>, nil]
      optional :extraction_rules,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::AIAIQueryParams::ExtractionRule] }

      # @!method initialize(data_to_extract:, domain:, authentication_3ds: nil, datapoint_object_schema: nil, extraction_rules: nil, request_options: {})
      #   @param data_to_extract [Array<HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract>] Non-plural array property: singularization is a no-op (decisive probe)
      #
      #   @param domain [String] The domain name to analyze
      #
      #   @param authentication_3ds [HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS] Digit-seam acronym parent for nested element mints
      #
      #   @param datapoint_object_schema [Hash{Symbol=>Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::DatapointObjectSchema}] Non-plural map property with enum values (map-mint probe)
      #
      #   @param extraction_rules [Array<HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule>] Plural array property: singularized element mint (control probe)
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      class DataToExtract < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute datapoint_name
        #
        #   @return [String]
        required :datapoint_name, String

        # @!attribute datapoint_type
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract::DatapointType, nil]
        optional :datapoint_type, enum: -> { HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType }

        # @!method initialize(datapoint_name:, datapoint_type: nil)
        #   @param datapoint_name [String]
        #   @param datapoint_type [Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract::DatapointType]

        # @see HelloWorldTestingggg::Models::AIAIQueryParams::DataToExtract#datapoint_type
        module DatapointType
          extend HelloWorldTestingggg::Internal::Type::Enum

          TEXT = :text
          NUMBER = :number

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Authentication3DS < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute challenge_rules
        #   Plural array under the 3DS seam
        #
        #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS::ChallengeRule>, nil]
        optional :challenge_rules,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule] }

        # @!attribute fallback_check
        #   Non-plural array under the 3DS seam
        #
        #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS::FallbackCheck>, nil]
        optional :fallback_check,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck] }

        # @!method initialize(challenge_rules: nil, fallback_check: nil)
        #   Digit-seam acronym parent for nested element mints
        #
        #   @param challenge_rules [Array<HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS::ChallengeRule>] Plural array under the 3DS seam
        #
        #   @param fallback_check [Array<HelloWorldTestingggg::Models::AIAIQueryParams::Authentication3DS::FallbackCheck>] Non-plural array under the 3DS seam

        class ChallengeRule < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute challenge_kind
          #
          #   @return [String, nil]
          optional :challenge_kind, String

          # @!method initialize(challenge_kind: nil)
          #   @param challenge_kind [String]
        end

        class FallbackCheck < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute check_name
          #
          #   @return [String, nil]
          optional :check_name, String

          # @!method initialize(check_name: nil)
          #   @param check_name [String]
        end
      end

      module DatapointObjectSchema
        extend HelloWorldTestingggg::Internal::Type::Enum

        STRING = :string
        NUMBER = :number
        BOOLEAN = :boolean

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class ExtractionRule < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute rule_name
        #
        #   @return [String, nil]
        optional :rule_name, String

        # @!attribute rule_severity
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule::RuleSeverity, nil]
        optional :rule_severity, enum: -> { HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity }

        # @!method initialize(rule_name: nil, rule_severity: nil)
        #   @param rule_name [String]
        #   @param rule_severity [Symbol, HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule::RuleSeverity]

        # @see HelloWorldTestingggg::Models::AIAIQueryParams::ExtractionRule#rule_severity
        module RuleSeverity
          extend HelloWorldTestingggg::Internal::Type::Enum

          LOW = :low
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
