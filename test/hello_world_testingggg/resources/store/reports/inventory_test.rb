# frozen_string_literal: true

require_relative "../../../test_helper"

class HelloWorldTestingggg::Test::Resources::Store::Reports::InventoryTest < HelloWorldTestingggg::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.reports.inventory.list("reportId")

    assert_pattern do
      response => HelloWorldTestingggg::Store::InventoryResponse
    end

    assert_pattern do
      response => {
        data: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Store::InventoryResponse::Data])
      }
    end
  end
end
