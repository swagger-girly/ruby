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

  def test_retrieve_activity
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.retrieve_activity("activityId")

    assert_pattern do
      response => HelloWorldTestingggg::Models::StoreRetrieveActivityResponse
    end

    assert_pattern do
      case response
      in HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed
      in HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold
      in HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived
      in HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred
      end
    end
  end
end
