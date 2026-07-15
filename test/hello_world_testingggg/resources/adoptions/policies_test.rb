# frozen_string_literal: true

require_relative "../../test_helper"

class HelloWorldTestingggg::Test::Resources::Adoptions::PoliciesTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @hello_world_testingggg.adoptions.policies.create(
        name: "name",
        rules: [{attribute: :PET_STATUS, operation: :IS_ONE_OF}]
      )

    assert_pattern do
      response => HelloWorldTestingggg::Adoptions::Policy
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        rules: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule]),
        status: HelloWorldTestingggg::Adoptions::Policy::Status,
        escalation: HelloWorldTestingggg::Adoptions::Policy::Escalation | nil,
        fee_cap: HelloWorldTestingggg::Money | nil,
        notification_target: HelloWorldTestingggg::Adoptions::Policy::NotificationTarget | nil,
        regional_overrides: ^(HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]) | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.policies.retrieve("policyId")

    assert_pattern do
      response => HelloWorldTestingggg::Adoptions::Policy
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        rules: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule]),
        status: HelloWorldTestingggg::Adoptions::Policy::Status,
        escalation: HelloWorldTestingggg::Adoptions::Policy::Escalation | nil,
        fee_cap: HelloWorldTestingggg::Money | nil,
        notification_target: HelloWorldTestingggg::Adoptions::Policy::NotificationTarget | nil,
        regional_overrides: ^(HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.policies.update("policyId", body: {})

    assert_pattern do
      response => HelloWorldTestingggg::Adoptions::Policy
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        rules: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule]),
        status: HelloWorldTestingggg::Adoptions::Policy::Status,
        escalation: HelloWorldTestingggg::Adoptions::Policy::Escalation | nil,
        fee_cap: HelloWorldTestingggg::Money | nil,
        notification_target: HelloWorldTestingggg::Adoptions::Policy::NotificationTarget | nil,
        regional_overrides: ^(HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]) | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.adoptions.policies.list

    assert_pattern do
      response => HelloWorldTestingggg::Internal::CustomCursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => HelloWorldTestingggg::Adoptions::Policy
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        name: String,
        rules: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Adoptions::AdoptionRule]),
        status: HelloWorldTestingggg::Adoptions::Policy::Status,
        escalation: HelloWorldTestingggg::Adoptions::Policy::Escalation | nil,
        fee_cap: HelloWorldTestingggg::Money | nil,
        notification_target: HelloWorldTestingggg::Adoptions::Policy::NotificationTarget | nil,
        regional_overrides: ^(HelloWorldTestingggg::Internal::Type::HashOf[union: HelloWorldTestingggg::Adoptions::ConditionValue]) | nil
      }
    end
  end
end
