# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Pet owner profile and compliance operations
    class Profiles
      # Creates a pet owner profile with nested preferences, metadata maps, and
      # compliance-only write fields.
      #
      # @overload create(display_name:, email: nil, government_id: nil, metadata: nil, preferences: nil, secret_note: nil, idempotency_key: nil, request_options: {})
      #
      # @param display_name [String] Body param
      #
      # @param email [String, nil] Body param
      #
      # @param government_id [String] Body param: Compliance identifier used only during profile creation.
      #
      # @param metadata [Hash{Symbol=>String}] Body param
      #
      # @param preferences [HelloWorldTestingggg::Models::ProfileCreateRequest::Preferences] Body param
      #
      # @param secret_note [String] Body param: Internal note that must not be emitted in profile responses.
      #
      # @param idempotency_key [String] Header param: Unique key used to safely retry profile mutations.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Profile]
      #
      # @see HelloWorldTestingggg::Models::ProfileCreateParams
      def create(params)
        parsed, options = HelloWorldTestingggg::ProfileCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "profiles",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: HelloWorldTestingggg::Profile,
          options: options
        )
      end

      # Returns a profile with read-only version fields and nullable contact
      # preferences.
      #
      # @overload retrieve(profile_id, request_options: {})
      #
      # @param profile_id [String] Profile identifier.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Profile]
      #
      # @see HelloWorldTestingggg::Models::ProfileRetrieveParams
      def retrieve(profile_id, params = {})
        @client.request(
          method: :get,
          path: ["profiles/%1$s", profile_id],
          model: HelloWorldTestingggg::Profile,
          options: params[:request_options]
        )
      end

      # Updates either public profile details or archival state.
      #
      # @overload update(profile_id, body:, idempotency_key: nil, request_options: {})
      #
      # @param profile_id [String] Path param: Profile identifier.
      #
      # @param body [HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate] Body param
      #
      # @param idempotency_key [String] Header param: Unique key used to safely retry profile mutations.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Profile]
      #
      # @see HelloWorldTestingggg::Models::ProfileUpdateParams
      def update(profile_id, params)
        parsed, options = HelloWorldTestingggg::ProfileUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["profiles/%1$s", profile_id],
          headers: parsed.except(:body).transform_keys(idempotency_key: "idempotency-key"),
          body: parsed[:body],
          model: HelloWorldTestingggg::Profile,
          options: options
        )
      end

      # @deprecated
      #
      # Deprecated profile search endpoint kept for compatibility.
      #
      # @overload legacy_search(include_archived: nil, q: nil, request_options: {})
      #
      # @param include_archived [Boolean] Whether archived profiles should be included.
      #
      # @param q [String] Legacy free-text search string.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<HelloWorldTestingggg::Models::Profile>]
      #
      # @see HelloWorldTestingggg::Models::ProfileLegacySearchParams
      def legacy_search(params = {})
        parsed, options = HelloWorldTestingggg::ProfileLegacySearchParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "profiles/legacy-search",
          query: query,
          model: HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Profile],
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
