# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::PlacementsTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.placements.create(application_id: "applicationId")

    assert_pattern do
      response => HelloWorldTestingggg::Placement
    end

    assert_pattern do
      response => {
        id: String,
        application: HelloWorldTestingggg::Application,
        created_at: Time,
        status: HelloWorldTestingggg::Placement::Status,
        activity: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::Placement::Activity]) | nil,
        events: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::PlacementEvent]) | nil,
        follow_up_after: Time | nil,
        logistics: HelloWorldTestingggg::Placement::Logistics | nil,
        medical_clearance: HelloWorldTestingggg::MedicalSummary | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.placements.retrieve("placementId")

    assert_pattern do
      response => HelloWorldTestingggg::Placement
    end

    assert_pattern do
      response => {
        id: String,
        application: HelloWorldTestingggg::Application,
        created_at: Time,
        status: HelloWorldTestingggg::Placement::Status,
        activity: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::Placement::Activity]) | nil,
        events: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::PlacementEvent]) | nil,
        follow_up_after: Time | nil,
        logistics: HelloWorldTestingggg::Placement::Logistics | nil,
        medical_clearance: HelloWorldTestingggg::MedicalSummary | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.placements.list

    assert_pattern do
      response => HelloWorldTestingggg::Internal::CustomCursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => HelloWorldTestingggg::Placement
    end

    assert_pattern do
      row => {
        id: String,
        application: HelloWorldTestingggg::Application,
        created_at: Time,
        status: HelloWorldTestingggg::Placement::Status,
        activity: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::Placement::Activity]) | nil,
        events: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::PlacementEvent]) | nil,
        follow_up_after: Time | nil,
        logistics: HelloWorldTestingggg::Placement::Logistics | nil,
        medical_clearance: HelloWorldTestingggg::MedicalSummary | nil
      }
    end
  end

  def test_record_event_required_params
    skip("Mock server tests are disabled")

    response =
      @hello_world_testingggg.placements.record_event(
        "placementId",
        placement_event: {
          id: "id",
          leg: {location: {}},
          occurredAt: "2019-12-27T18:11:19.117Z",
          type: :transfer
        }
      )

    assert_pattern do
      response => HelloWorldTestingggg::Placement
    end

    assert_pattern do
      response => {
        id: String,
        application: HelloWorldTestingggg::Application,
        created_at: Time,
        status: HelloWorldTestingggg::Placement::Status,
        activity: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::Placement::Activity]) | nil,
        events: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[union: HelloWorldTestingggg::PlacementEvent]) | nil,
        follow_up_after: Time | nil,
        logistics: HelloWorldTestingggg::Placement::Logistics | nil,
        medical_clearance: HelloWorldTestingggg::MedicalSummary | nil
      }
    end
  end
end
