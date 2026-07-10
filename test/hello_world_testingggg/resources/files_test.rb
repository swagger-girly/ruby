# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::FilesTest < HelloWorldTestingggg::Test::ResourceTest
  def test_update
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.update("path")

    assert_pattern do
      response => HelloWorldTestingggg::File
    end

    assert_pattern do
      response => {
        last_modified: Time,
        path: String,
        size: Integer,
        content_type: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.list

    assert_pattern do
      response => HelloWorldTestingggg::Fileslist
    end

    assert_pattern do
      response => {
        data: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::File])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.delete("path")

    assert_pattern do
      response => nil
    end
  end

  def test_create_archive_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.create_archive(files: [StringIO.new("Example data")])

    assert_pattern do
      response => HelloWorldTestingggg::Archive
    end

    assert_pattern do
      response => {
        id: String,
        status: HelloWorldTestingggg::Archive::Status,
        file_count: Integer | nil
      }
    end
  end

  def test_download
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.download("path")

    assert_pattern do
      response => StringIO
    end
  end

  def test_upload_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.upload(file: StringIO.new("Example data"))

    assert_pattern do
      response => HelloWorldTestingggg::File
    end

    assert_pattern do
      response => {
        last_modified: Time,
        path: String,
        size: Integer,
        content_type: String | nil
      }
    end
  end

  def test_upload_direct_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.files.upload_direct(body: StringIO.new("Example data"))

    assert_pattern do
      response => HelloWorldTestingggg::File
    end

    assert_pattern do
      response => {
        last_modified: Time,
        path: String,
        size: Integer,
        content_type: String | nil
      }
    end
  end
end
