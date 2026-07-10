# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::ProfilesTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.profiles.create(display_name: "Ada Lovelace")

    assert_pattern do
      response => HelloWorldTestingggg::Profile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        updated_at: Time,
        version: Integer,
        audit_trail: ^(HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]) | nil,
        email: String | nil,
        legacy_code: String | nil,
        metadata: ^(HelloWorldTestingggg::Internal::Type::HashOf[String]) | nil,
        phone_numbers: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]) | nil,
        preferences: HelloWorldTestingggg::Profile::Preferences | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.profiles.retrieve("profileId")

    assert_pattern do
      response => HelloWorldTestingggg::Profile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        updated_at: Time,
        version: Integer,
        audit_trail: ^(HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]) | nil,
        email: String | nil,
        legacy_code: String | nil,
        metadata: ^(HelloWorldTestingggg::Internal::Type::HashOf[String]) | nil,
        phone_numbers: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]) | nil,
        preferences: HelloWorldTestingggg::Profile::Preferences | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.profiles.update("profileId", body: {})

    assert_pattern do
      response => HelloWorldTestingggg::Profile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        updated_at: Time,
        version: Integer,
        audit_trail: ^(HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]) | nil,
        email: String | nil,
        legacy_code: String | nil,
        metadata: ^(HelloWorldTestingggg::Internal::Type::HashOf[String]) | nil,
        phone_numbers: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]) | nil,
        preferences: HelloWorldTestingggg::Profile::Preferences | nil
      }
    end
  end

  def test_legacy_search
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.profiles.legacy_search

    assert_pattern do
      response => ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Profile])
    end
  end
end
