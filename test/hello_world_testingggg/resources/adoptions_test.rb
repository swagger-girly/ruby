# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::AdoptionsTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.create(body: {applicant_type: :individual, name: "name"})

    assert_pattern do
      response => HelloWorldTestingggg::Application
    end

    assert_pattern do
      response => {
        id: String,
        applicant: HelloWorldTestingggg::Application::Applicant,
        status: HelloWorldTestingggg::Application::Status,
        submitted_at: Time,
        decision: HelloWorldTestingggg::Application::Decision | nil,
        fee: HelloWorldTestingggg::Money | nil,
        history: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Application::History]) | nil,
        latest_rejection: HelloWorldTestingggg::Application::LatestRejection | nil,
        pet: HelloWorldTestingggg::PetAPI | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.retrieve("applicationId")

    assert_pattern do
      response => HelloWorldTestingggg::Application
    end

    assert_pattern do
      response => {
        id: String,
        applicant: HelloWorldTestingggg::Application::Applicant,
        status: HelloWorldTestingggg::Application::Status,
        submitted_at: Time,
        decision: HelloWorldTestingggg::Application::Decision | nil,
        fee: HelloWorldTestingggg::Money | nil,
        history: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Application::History]) | nil,
        latest_rejection: HelloWorldTestingggg::Application::LatestRejection | nil,
        pet: HelloWorldTestingggg::PetAPI | nil
      }
    end
  end

  def test_retrieve_decision
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.retrieve_decision("applicationId")

    assert_pattern do
      response => HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse
    end

    assert_pattern do
      case response
      in HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved
      in HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected
      in HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated
      end
    end
  end
end
