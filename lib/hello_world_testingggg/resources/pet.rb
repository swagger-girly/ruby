# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Everything about your Pets
    class Pet
      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::PetCreateParams} for more details.
      #
      # Add a new pet to the store
      #
      # @overload create(name:, photo_urls:, id: nil, acquisition_channel: nil, category: nil, microchip_id: nil, status: nil, tags: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param photo_urls [Array<String>]
      #
      # @param id [Integer]
      #
      # @param acquisition_channel [Symbol, String, HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel] How the pet entered the store. Open enum: known channels plus forward-compatible
      #
      # @param category [HelloWorldTestingggg::Models::PetAPI::Category]
      #
      # @param microchip_id [String, Integer] Microchip identifier; legacy chips used numeric identifiers.
      #
      # @param status [Symbol, HelloWorldTestingggg::Models::PetStatus] pet status in the store
      #
      # @param tags [Array<HelloWorldTestingggg::Models::PetAPI::Tag>]
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetAPI]
      #
      # @see HelloWorldTestingggg::Models::PetCreateParams
      def create(params)
        parsed, options = HelloWorldTestingggg::PetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "pet",
          body: parsed,
          model: HelloWorldTestingggg::PetAPI,
          options: options
        )
      end

      # Returns a single pet
      #
      # @overload retrieve(pet_id, request_options: {})
      #
      # @param pet_id [Integer] ID of pet to return
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetAPI]
      #
      # @see HelloWorldTestingggg::Models::PetRetrieveParams
      def retrieve(pet_id, params = {})
        @client.request(
          method: :get,
          path: ["pet/%1$s", pet_id],
          model: HelloWorldTestingggg::PetAPI,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::PetUpdateParams} for more details.
      #
      # Update an existing pet by Id
      #
      # @overload update(name:, photo_urls:, id: nil, acquisition_channel: nil, category: nil, microchip_id: nil, status: nil, tags: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param photo_urls [Array<String>]
      #
      # @param id [Integer]
      #
      # @param acquisition_channel [Symbol, String, HelloWorldTestingggg::Models::PetAPI::AcquisitionChannel] How the pet entered the store. Open enum: known channels plus forward-compatible
      #
      # @param category [HelloWorldTestingggg::Models::PetAPI::Category]
      #
      # @param microchip_id [String, Integer] Microchip identifier; legacy chips used numeric identifiers.
      #
      # @param status [Symbol, HelloWorldTestingggg::Models::PetStatus] pet status in the store
      #
      # @param tags [Array<HelloWorldTestingggg::Models::PetAPI::Tag>]
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetAPI]
      #
      # @see HelloWorldTestingggg::Models::PetUpdateParams
      def update(params)
        parsed, options = HelloWorldTestingggg::PetUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: "pet",
          body: parsed,
          model: HelloWorldTestingggg::PetAPI,
          options: options
        )
      end

      # Returns a cursor-paginated list of pets.
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param created_at [HelloWorldTestingggg::Models::PetListParams::CreatedAt] Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
      #
      # @param cursor [String] Cursor from a previous response used to fetch the next page.
      #
      # @param limit [Integer] Maximum number of pets to return.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Internal::CustomCursorPage<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetListParams
      def list(params = {})
        parsed, options = HelloWorldTestingggg::PetListParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "pet",
          query: query,
          page: HelloWorldTestingggg::Internal::CustomCursorPage,
          model: HelloWorldTestingggg::PetAPI,
          options: options
        )
      end

      # Deletes a pet
      #
      # @overload delete(pet_id, request_options: {})
      #
      # @param pet_id [Integer] Pet id to delete
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::PetDeleteParams
      def delete(pet_id, params = {})
        @client.request(
          method: :delete,
          path: ["pet/%1$s", pet_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Multiple status values can be provided with comma separated strings
      #
      # @overload find_by_status(status: nil, request_options: {})
      #
      # @param status [Symbol, HelloWorldTestingggg::Models::PetFindByStatusParams::Status] Status values that need to be considered for filter
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetFindByStatusParams
      def find_by_status(params = {})
        parsed, options = HelloWorldTestingggg::PetFindByStatusParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "pet/findByStatus",
          query: query,
          model: HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI],
          options: options
        )
      end

      # Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3
      # for testing.
      #
      # @overload find_by_tags(tags: nil, request_options: {})
      #
      # @param tags [Array<String>] Tags to filter by
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetFindByTagsParams
      def find_by_tags(params = {})
        parsed, options = HelloWorldTestingggg::PetFindByTagsParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "pet/findByTags",
          query: query,
          model: HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI],
          options: options
        )
      end

      # Returns a single page-shaped pet response without SDK pagination helpers.
      #
      # @overload list_fake_page(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetListFakePageResponse]
      #
      # @see HelloWorldTestingggg::Models::PetListFakePageParams
      def list_fake_page(params = {})
        @client.request(
          method: :get,
          path: "pet/fake-page",
          model: HelloWorldTestingggg::Models::PetListFakePageResponse,
          options: params[:request_options]
        )
      end

      # Returns a single page-shaped pet response whose fake pagination behavior is
      # inferred from the config scheme.
      #
      # @overload list_fake_page_inferred(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Internal::XFakeSinglePage<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetListFakePageInferredParams
      def list_fake_page_inferred(params = {})
        @client.request(
          method: :get,
          path: "pet/fake-page-inferred",
          page: HelloWorldTestingggg::Internal::XFakeSinglePage,
          model: HelloWorldTestingggg::PetAPI,
          options: params[:request_options]
        )
      end

      # Returns the same cursor-shaped pet list response without enabling SDK pagination
      # helpers.
      #
      # @overload list_unpaginated(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Cursor from a previous response used to fetch the next page.
      #
      # @param limit [Integer] Maximum number of pets to return.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetListUnpaginatedResponse]
      #
      # @see HelloWorldTestingggg::Models::PetListUnpaginatedParams
      def list_unpaginated(params = {})
        parsed, options = HelloWorldTestingggg::PetListUnpaginatedParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "pet/unpaginated",
          query: query,
          model: HelloWorldTestingggg::Models::PetListUnpaginatedResponse,
          options: options
        )
      end

      # Returns the premium profile for a pet, extending the base pet with pedigree and
      # insurance details.
      #
      # @overload retrieve_premium(pet_id, request_options: {})
      #
      # @param pet_id [Integer] ID of pet to return the premium profile for
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetRetrievePremiumResponse]
      #
      # @see HelloWorldTestingggg::Models::PetRetrievePremiumParams
      def retrieve_premium(pet_id, params = {})
        @client.request(
          method: :get,
          path: ["pet/%1$s/premium", pet_id],
          model: HelloWorldTestingggg::Models::PetRetrievePremiumResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::PetSearchParams} for more details.
      #
      # Typed query-parameter probe matrix: an object-schema query param mints a typed
      # params model, an array-of-object query param mints a singularized element type,
      # an empty object (additionalProperties:false) stays a bare object, and a scalar
      # stays scalar. Isolates the emitter query-parameter type-resolution branches so
      # object/array-of-object/empty-object params are each exercised.
      #
      # @overload search(filters: nil, max_results: nil, raw_filter: nil, tag_filters: nil, request_options: {})
      #
      # @param filters [HelloWorldTestingggg::Models::PetSearchParams::Filters] Object-schema query parameter: mints a typed params model instead of collapsing
      #
      # @param max_results [Integer] Scalar query parameter: stays a plain scalar (control probe).
      #
      # @param raw_filter [Object] Empty-object query parameter (additionalProperties:false): stays a bare object,
      #
      # @param tag_filters [Array<HelloWorldTestingggg::Models::PetSearchParams::TagFilter>] Array-of-object query parameter: emitters mint a singularized element type for e
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetSearchParams
      def search(params = {})
        parsed, options = HelloWorldTestingggg::PetSearchParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "pet/search",
          query: query,
          model: HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI],
          options: options
        )
      end

      # Updates a pet in the store with form data
      #
      # @overload update_with_form(pet_id, name: nil, status: nil, request_options: {})
      #
      # @param pet_id [Integer] ID of pet that needs to be updated
      #
      # @param name [String] Name of pet that needs to be updated
      #
      # @param status [String] Status of pet that needs to be updated
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::PetUpdateWithFormParams
      def update_with_form(pet_id, params = {})
        parsed, options = HelloWorldTestingggg::PetUpdateWithFormParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: ["pet/%1$s", pet_id],
          query: query,
          model: NilClass,
          options: options
        )
      end

      # uploads an image
      #
      # @overload upload_image(pet_id, body:, additional_metadata: nil, request_options: {})
      #
      # @param pet_id [Integer] Path param: ID of pet to update
      #
      # @param body [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] Body param
      #
      # @param additional_metadata [String] Query param: Additional Metadata
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::PetUploadImageResponse]
      #
      # @see HelloWorldTestingggg::Models::PetUploadImageParams
      def upload_image(pet_id, params)
        parsed, options = HelloWorldTestingggg::PetUploadImageParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed.except(:body))
        @client.request(
          method: :post,
          path: ["pet/%1$s/uploadImage", pet_id],
          query: query,
          headers: {"content-type" => "application/octet-stream"},
          body: parsed[:body],
          model: HelloWorldTestingggg::Models::PetUploadImageResponse,
          options: options
        )
      end

      # Streams pet status updates over Server-Sent Events. Each `status` event contains
      # a full `Pet` payload.
      #
      # @overload watch_status_streaming(pet_id, last_event_id: nil, request_options: {})
      #
      # @param pet_id [Integer] ID of pet to watch
      #
      # @param last_event_id [String] Optional event identifier used to resume a previous stream.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Internal::Stream<HelloWorldTestingggg::Models::PetAPI>]
      #
      # @see HelloWorldTestingggg::Models::PetWatchStatusParams
      def watch_status_streaming(pet_id, params = {})
        parsed, options = HelloWorldTestingggg::PetWatchStatusParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["pet/%1$s/status/stream", pet_id],
          headers: {
            "accept" => "text/event-stream",
            "accept-encoding" => "identity",
            **parsed
          }.transform_keys(
            last_event_id: "last-event-id"
          ),
          stream: HelloWorldTestingggg::Internal::Stream,
          model: HelloWorldTestingggg::PetAPI,
          options: options
        )
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
