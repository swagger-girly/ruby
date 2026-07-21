# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::MediaTest < HelloWorldTestingggg::Test::ResourceTest
  def test_binary_and_json
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.binary_and_json

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaBinaryAndJsonResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end

  def test_json_and_xml
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.json_and_xml

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaJsonAndXmlResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end

  def test_json_first
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.json_first

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaJsonFirstResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end

  def test_schema_on_json
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.schema_on_json

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaSchemaOnJsonResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end

  def test_schema_on_text
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.schema_on_text

    assert_pattern do
      response => nil
    end
  end

  def test_text_first
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.text_first

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaTextFirstResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end

  def test_text_only
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.text_only

    assert_pattern do
      response => String
    end
  end

  def test_vendor_json
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.media.vendor_json

    assert_pattern do
      response => HelloWorldTestingggg::Models::MediaVendorJsonResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String | nil
      }
    end
  end
end
