# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::AITest < HelloWorldTestingggg::Test::ResourceTest
  def test_ai_query_required_params
    skip("Mock server tests are disabled")

    response =
      @hello_world_testingggg.ai.ai_query(
        data_to_extract: [{datapoint_name: "datapoint_name"}],
        domain: "domain"
      )

    assert_pattern do
      response => HelloWorldTestingggg::Models::AIAIQueryResponse
    end

    assert_pattern do
      response => {
        data_extracted: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted]) | nil,
        matched_rules: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule]) | nil
      }
    end
  end
end
