# frozen_string_literal: true

require_relative "../../test_helper"

class HelloWorldTestingggg::Test::Resources::Store::ReportsTest < HelloWorldTestingggg::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.reports.retrieve("reportId")

    assert_pattern do
      response => HelloWorldTestingggg::Store::Report
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: HelloWorldTestingggg::Store::Report::Status,
        completed_at: Time | nil,
        filters: ^(HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]) | nil,
        totals: ^(HelloWorldTestingggg::Internal::Type::HashOf[Integer]) | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.reports.list

    assert_pattern do
      response => HelloWorldTestingggg::Internal::ReportCursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => HelloWorldTestingggg::Store::Report
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        status: HelloWorldTestingggg::Store::Report::Status,
        completed_at: Time | nil,
        filters: ^(HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]) | nil,
        totals: ^(HelloWorldTestingggg::Internal::Type::HashOf[Integer]) | nil
      }
    end
  end

  def test_embed
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.reports.embed("reportId")

    assert_pattern do
      response => String
    end
  end

  def test_pause
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.reports.pause("reportId")

    assert_pattern do
      response => nil
    end
  end
end
