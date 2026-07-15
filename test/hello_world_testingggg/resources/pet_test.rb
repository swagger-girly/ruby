# frozen_string_literal: true

require_relative "../test_helper"

class HelloWorldTestingggg::Test::Resources::PetTest < HelloWorldTestingggg::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.create(name: "doggie", photo_urls: ["string"])

    assert_pattern do
      response => HelloWorldTestingggg::PetAPI
    end

    assert_pattern do
      response => {
        name: String,
        photo_urls: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]),
        id: Integer | nil,
        category: HelloWorldTestingggg::PetAPI::Category | nil,
        microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID | nil,
        status: HelloWorldTestingggg::PetStatus | nil,
        tags: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag]) | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.retrieve(0)

    assert_pattern do
      response => HelloWorldTestingggg::PetAPI
    end

    assert_pattern do
      response => {
        name: String,
        photo_urls: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]),
        id: Integer | nil,
        category: HelloWorldTestingggg::PetAPI::Category | nil,
        microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID | nil,
        status: HelloWorldTestingggg::PetStatus | nil,
        tags: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.update(name: "doggie", photo_urls: ["string"])

    assert_pattern do
      response => HelloWorldTestingggg::PetAPI
    end

    assert_pattern do
      response => {
        name: String,
        photo_urls: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]),
        id: Integer | nil,
        category: HelloWorldTestingggg::PetAPI::Category | nil,
        microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID | nil,
        status: HelloWorldTestingggg::PetStatus | nil,
        tags: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag]) | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.list

    assert_pattern do
      response => HelloWorldTestingggg::Internal::CustomCursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => HelloWorldTestingggg::PetAPI
    end

    assert_pattern do
      row => {
        name: String,
        photo_urls: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]),
        id: Integer | nil,
        category: HelloWorldTestingggg::PetAPI::Category | nil,
        microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID | nil,
        status: HelloWorldTestingggg::PetStatus | nil,
        tags: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag]) | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.delete(0)

    assert_pattern do
      response => nil
    end
  end

  def test_find_by_status
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.find_by_status

    assert_pattern do
      response => ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI])
    end
  end

  def test_find_by_tags
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.find_by_tags

    assert_pattern do
      response => ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI])
    end
  end

  def test_list_fake_page
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.list_fake_page

    assert_pattern do
      response => HelloWorldTestingggg::Models::PetListFakePageResponse
    end

    assert_pattern do
      response => {
        data: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI]),
        has_more: HelloWorldTestingggg::Internal::Type::Boolean
      }
    end
  end

  def test_list_fake_page_inferred
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.list_fake_page_inferred

    assert_pattern do
      response => HelloWorldTestingggg::Internal::XFakeSinglePage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => HelloWorldTestingggg::PetAPI
    end

    assert_pattern do
      row => {
        name: String,
        photo_urls: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[String]),
        id: Integer | nil,
        category: HelloWorldTestingggg::PetAPI::Category | nil,
        microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID | nil,
        status: HelloWorldTestingggg::PetStatus | nil,
        tags: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI::Tag]) | nil
      }
    end
  end

  def test_list_unpaginated
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.list_unpaginated

    assert_pattern do
      response => HelloWorldTestingggg::Models::PetListUnpaginatedResponse
    end

    assert_pattern do
      response => {
        items: ^(HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI]),
        next_cursor: String | nil
      }
    end
  end

  def test_retrieve_premium
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.retrieve_premium(0)

    assert_pattern do
      response => HelloWorldTestingggg::Models::PetRetrievePremiumResponse
    end
  end

  def test_update_with_form
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.update_with_form(0)

    assert_pattern do
      response => nil
    end
  end

  def test_upload_image_required_params
    skip("Mock server tests are disabled")

    response = @hello_world_testingggg.pet.upload_image(0, body: StringIO.new("Example data"))

    assert_pattern do
      response => HelloWorldTestingggg::Models::PetUploadImageResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        message: String | nil,
        type: String | nil
      }
    end
  end
end
