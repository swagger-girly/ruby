# typed: strong

module HelloWorldTestingggg
  module Resources
    # Pet owner profile and compliance operations
    class Profiles
      # Creates a pet owner profile with nested preferences, metadata maps, and
      # compliance-only write fields.
      sig do
        params(
          display_name: String,
          email: T.nilable(String),
          government_id: String,
          metadata: T::Hash[Symbol, String],
          preferences:
            HelloWorldTestingggg::ProfileCreateRequest::Preferences::OrHash,
          secret_note: String,
          idempotency_key: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Profile)
      end
      def create(
        # Body param
        display_name:,
        # Body param
        email: nil,
        # Body param: Compliance identifier used only during profile creation.
        government_id: nil,
        # Body param
        metadata: nil,
        # Body param
        preferences: nil,
        # Body param: Internal note that must not be emitted in profile responses.
        secret_note: nil,
        # Header param: Unique key used to safely retry profile mutations.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Returns a profile with read-only version fields and nullable contact
      # preferences.
      sig do
        params(
          profile_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Profile)
      end
      def retrieve(
        # Profile identifier.
        profile_id,
        request_options: {}
      )
      end

      # Updates either public profile details or archival state.
      sig do
        params(
          profile_id: String,
          body:
            T.any(
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::OrHash,
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::OrHash
            ),
          idempotency_key: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Profile)
      end
      def update(
        # Path param: Profile identifier.
        profile_id,
        # Body param
        body:,
        # Header param: Unique key used to safely retry profile mutations.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Deprecated profile search endpoint kept for compatibility.
      sig do
        params(
          include_archived: T::Boolean,
          q: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T::Array[HelloWorldTestingggg::Profile])
      end
      def legacy_search(
        # Whether archived profiles should be included.
        include_archived: nil,
        # Legacy free-text search string.
        q: nil,
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
