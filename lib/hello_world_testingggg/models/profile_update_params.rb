# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Profiles#update
    class ProfileUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!attribute body
      #
      #   @return [HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate]
      required :body, union: -> { HelloWorldTestingggg::ProfileUpdateParams::Body }

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(profile_id:, body:, idempotency_key: nil, request_options: {})
      #   @param profile_id [String]
      #   @param body [HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate]
      #   @param idempotency_key [String]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      module Body
        extend HelloWorldTestingggg::Internal::Type::Union

        variant -> { HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate }

        variant -> { HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate }

        class ProfileDetailsUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute display_name
          #
          #   @return [String, nil]
          optional :display_name, String, api_name: :displayName

          # @!attribute email
          #
          #   @return [String, nil]
          optional :email, String, nil?: true

          # @!attribute metadata
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :metadata, HelloWorldTestingggg::Internal::Type::HashOf[String]

          # @!attribute preferences
          #
          #   @return [HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences, nil]
          optional :preferences,
                   -> { HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences }

          # @!method initialize(display_name: nil, email: nil, metadata: nil, preferences: nil)
          #   @param display_name [String]
          #   @param email [String, nil]
          #   @param metadata [Hash{Symbol=>String}]
          #   @param preferences [HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences]

          # @see HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate#preferences
          class Preferences < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute alerts
            #
            #   @return [Hash{Symbol=>Boolean}, nil]
            optional :alerts,
                     HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Boolean]

            # @!attribute newsletter
            #
            #   @return [Boolean, nil]
            optional :newsletter, HelloWorldTestingggg::Internal::Type::Boolean

            # @!attribute score_by_region
            #
            #   @return [Object, nil]
            optional :score_by_region, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :scoreByRegion

            # @!method initialize(alerts: nil, newsletter: nil, score_by_region: nil)
            #   @param alerts [Hash{Symbol=>Boolean}]
            #   @param newsletter [Boolean]
            #   @param score_by_region [Object]
          end
        end

        class ProfileArchiveUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute archived_at
          #
          #   @return [Time]
          required :archived_at, Time, api_name: :archivedAt

          # @!attribute archived_reason
          #
          #   @return [Symbol, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason]
          required :archived_reason,
                   enum: -> {
                     HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason
                   },
                   api_name: :archivedReason

          # @!method initialize(archived_at:, archived_reason:)
          #   @param archived_at [Time]
          #   @param archived_reason [Symbol, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason]

          # @see HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate#archived_reason
          module ArchivedReason
            extend HelloWorldTestingggg::Internal::Type::Enum

            DUPLICATE = :duplicate
            REQUESTED = :requested
            POLICY_VIOLATION = :policy_violation

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileDetailsUpdate, HelloWorldTestingggg::Models::ProfileUpdateParams::Body::ProfileArchiveUpdate)]
      end
    end
  end
end
