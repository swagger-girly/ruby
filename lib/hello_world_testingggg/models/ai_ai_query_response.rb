# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::AI#ai_query
    class AIAIQueryResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute data_extracted
      #   Non-plural array on the response side
      #
      #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted>, nil]
      optional :data_extracted,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted] }

      # @!attribute matched_rules
      #   Plural array on the response side
      #
      #   @return [Array<HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule>, nil]
      optional :matched_rules,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule] }

      # @!method initialize(data_extracted: nil, matched_rules: nil)
      #   @param data_extracted [Array<HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted>] Non-plural array on the response side
      #
      #   @param matched_rules [Array<HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule>] Plural array on the response side

      class DataExtracted < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute datapoint_value
        #
        #   @return [String, nil]
        optional :datapoint_value, String

        # @!method initialize(datapoint_value: nil)
        #   @param datapoint_value [String]
      end

      class MatchedRule < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute match_score
        #
        #   @return [Float, nil]
        optional :match_score, Float

        # @!method initialize(match_score: nil)
        #   @param match_score [Float]
      end
    end
  end
end
