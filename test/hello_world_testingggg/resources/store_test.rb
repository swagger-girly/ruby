# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::StoreTest < HelloWorldTestingggg::Test::ResourceTest
  def test_list_inventory
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.list_inventory

    assert_pattern do
      response => ^(HelloWorldTestingggg::Internal::Type::HashOf[Integer])
    end
  end
end
