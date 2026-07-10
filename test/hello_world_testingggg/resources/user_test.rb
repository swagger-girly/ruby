# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::UserTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.create

    assert_pattern do
      response => HelloWorldTestingggg::Models::UserCreateResponse
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.retrieve("username")

    assert_pattern do
      response => HelloWorldTestingggg::Models::UserRetrieveResponse
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.update("username")

    assert_pattern do
      response => nil
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.delete("username")

    assert_pattern do
      response => nil
    end
  end

  def test_create_with_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.create_with_list

    assert_pattern do
      response => HelloWorldTestingggg::Models::UserCreateWithListResponse
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_login
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.login

    assert_pattern do
      response => String
    end
  end

  def test_logout
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.user.logout

    assert_pattern do
      response => nil
    end
  end
end
