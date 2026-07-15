# frozen_string_literal: true

require_relative "../../test_helper"

class HelloWorldTestingggg::Test::Resources::Store::OrderTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.order.create

    assert_pattern do
      response => HelloWorldTestingggg::Models::Store::OrderCreateResponse
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        complete: HelloWorldTestingggg::Internal::Type::Boolean | nil,
        pet_id: Integer | nil,
        quantity: Integer | nil,
        ship_date: Time | nil,
        status: HelloWorldTestingggg::Models::Store::OrderCreateResponse::Status | nil,
        total: HelloWorldTestingggg::Money | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.order.retrieve(0)

    assert_pattern do
      response => HelloWorldTestingggg::Models::Store::OrderRetrieveResponse
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        complete: HelloWorldTestingggg::Internal::Type::Boolean | nil,
        pet_id: Integer | nil,
        quantity: Integer | nil,
        ship_date: Time | nil,
        status: HelloWorldTestingggg::Models::Store::OrderRetrieveResponse::Status | nil,
        total: HelloWorldTestingggg::Money | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.store.order.delete(0)

    assert_pattern do
      response => nil
    end
  end
end
