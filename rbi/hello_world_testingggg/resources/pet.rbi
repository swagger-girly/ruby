# typed: strong

module HelloWorldTestingggg
  module Resources
    # Everything about your Pets
    class Pet
      # Add a new pet to the store
      sig do
        params(
          name: String,
          photo_urls: T::Array[String],
          id: Integer,
          acquisition_channel:
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
              String
            ),
          category: HelloWorldTestingggg::PetAPI::Category::OrHash,
          microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
          status: HelloWorldTestingggg::PetStatus::OrSymbol,
          tags: T::Array[HelloWorldTestingggg::PetAPI::Tag::OrHash],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::PetAPI)
      end
      def create(
        name:,
        photo_urls:,
        id: nil,
        # How the pet entered the store. Open enum: known channels plus forward-compatible
        # free-form strings.
        acquisition_channel: nil,
        category: nil,
        # Microchip identifier; legacy chips used numeric identifiers.
        microchip_id: nil,
        # pet status in the store
        status: nil,
        tags: nil,
        request_options: {}
      )
      end

      # Returns a single pet
      sig do
        params(
          pet_id: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::PetAPI)
      end
      def retrieve(
        # ID of pet to return
        pet_id,
        request_options: {}
      )
      end

      # Update an existing pet by Id
      sig do
        params(
          name: String,
          photo_urls: T::Array[String],
          id: Integer,
          acquisition_channel:
            T.any(
              HelloWorldTestingggg::PetAPI::AcquisitionChannel::OrSymbol,
              String
            ),
          category: HelloWorldTestingggg::PetAPI::Category::OrHash,
          microchip_id: HelloWorldTestingggg::PetAPI::MicrochipID::Variants,
          status: HelloWorldTestingggg::PetStatus::OrSymbol,
          tags: T::Array[HelloWorldTestingggg::PetAPI::Tag::OrHash],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::PetAPI)
      end
      def update(
        name:,
        photo_urls:,
        id: nil,
        # How the pet entered the store. Open enum: known channels plus forward-compatible
        # free-form strings.
        acquisition_channel: nil,
        category: nil,
        # Microchip identifier; legacy chips used numeric identifiers.
        microchip_id: nil,
        # pet status in the store
        status: nil,
        tags: nil,
        request_options: {}
      )
      end

      # Returns a cursor-paginated list of pets.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Internal::CustomCursorPage[
            HelloWorldTestingggg::PetAPI
          ]
        )
      end
      def list(
        # Cursor from a previous response used to fetch the next page.
        cursor: nil,
        # Maximum number of pets to return.
        limit: nil,
        request_options: {}
      )
      end

      # Deletes a pet
      sig do
        params(
          pet_id: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Pet id to delete
        pet_id,
        request_options: {}
      )
      end

      # Multiple status values can be provided with comma separated strings
      sig do
        params(
          status: HelloWorldTestingggg::PetFindByStatusParams::Status::OrSymbol,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T::Array[HelloWorldTestingggg::PetAPI])
      end
      def find_by_status(
        # Status values that need to be considered for filter
        status: nil,
        request_options: {}
      )
      end

      # Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3
      # for testing.
      sig do
        params(
          tags: T::Array[String],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T::Array[HelloWorldTestingggg::PetAPI])
      end
      def find_by_tags(
        # Tags to filter by
        tags: nil,
        request_options: {}
      )
      end

      # Returns a single page-shaped pet response without SDK pagination helpers.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::PetListFakePageResponse)
      end
      def list_fake_page(request_options: {})
      end

      # Returns a single page-shaped pet response whose fake pagination behavior is
      # inferred from the config scheme.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Internal::XFakeSinglePage[
            HelloWorldTestingggg::PetAPI
          ]
        )
      end
      def list_fake_page_inferred(request_options: {})
      end

      # Returns the same cursor-shaped pet list response without enabling SDK pagination
      # helpers.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::PetListUnpaginatedResponse)
      end
      def list_unpaginated(
        # Cursor from a previous response used to fetch the next page.
        cursor: nil,
        # Maximum number of pets to return.
        limit: nil,
        request_options: {}
      )
      end

      # Returns the premium profile for a pet, extending the base pet with pedigree and
      # insurance details.
      sig do
        params(
          pet_id: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::PetRetrievePremiumResponse)
      end
      def retrieve_premium(
        # ID of pet to return the premium profile for
        pet_id,
        request_options: {}
      )
      end

      # Updates a pet in the store with form data
      sig do
        params(
          pet_id: Integer,
          name: String,
          status: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def update_with_form(
        # ID of pet that needs to be updated
        pet_id,
        # Name of pet that needs to be updated
        name: nil,
        # Status of pet that needs to be updated
        status: nil,
        request_options: {}
      )
      end

      # uploads an image
      sig do
        params(
          pet_id: Integer,
          body: HelloWorldTestingggg::Internal::FileInput,
          additional_metadata: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::PetUploadImageResponse)
      end
      def upload_image(
        # Path param: ID of pet to update
        pet_id,
        # Body param
        body:,
        # Query param: Additional Metadata
        additional_metadata: nil,
        request_options: {}
      )
      end

      # Streams pet status updates over Server-Sent Events. Each `status` event contains
      # a full `Pet` payload.
      sig do
        params(
          pet_id: Integer,
          last_event_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Internal::Stream[HelloWorldTestingggg::PetAPI]
        )
      end
      def watch_status_streaming(
        # ID of pet to watch
        pet_id,
        # Optional event identifier used to resume a previous stream.
        last_event_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
