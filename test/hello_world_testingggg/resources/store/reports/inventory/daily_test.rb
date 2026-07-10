# frozen_string_literal: true

require_relative "../../../../test_helper"

class HelloWorldTestingggg::Test::Resources::Store::Reports::Inventory::DailyTest < HelloWorldTestingggg::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @hello_world_testingggg.store.reports.inventory.daily.retrieve("2019-12-27", report_id: "reportId")

    assert_pattern do
      response => HelloWorldTestingggg::Store::DailyInventory
    end

    assert_pattern do
      response => {
        date: Date,
        metrics: HelloWorldTestingggg::Internal::Type::Unknown,
        notes: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
