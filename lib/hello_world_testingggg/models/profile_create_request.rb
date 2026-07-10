# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class ProfileCreateRequest < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute display_name
      #
      #   @return [String]
      required :display_name, String, api_name: :displayName

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
      #   @return [HelloWorldTestingggg::Models::ProfileCreateRequest::Preferences, nil]
      optional :preferences, -> { HelloWorldTestingggg::ProfileCreateRequest::Preferences }

      request_only do
        # @!attribute government_id
        #   Compliance identifier used only during profile creation.
        #
        #   @return [String, nil]
        optional :government_id, String, api_name: :governmentId

        # @!attribute secret_note
        #   Internal note that must not be emitted in profile responses.
        #
        #   @return [String, nil]
        optional :secret_note, String, api_name: :secretNote
      end

      # @!method initialize(display_name:, email: nil, government_id: nil, metadata: nil, preferences: nil, secret_note: nil)
      #   @param display_name [String]
      #
      #   @param email [String, nil]
      #
      #   @param government_id [String] Compliance identifier used only during profile creation.
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param preferences [HelloWorldTestingggg::Models::ProfileCreateRequest::Preferences]
      #
      #   @param secret_note [String] Internal note that must not be emitted in profile responses.

      # @see HelloWorldTestingggg::Models::ProfileCreateRequest#preferences
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
  end
end
