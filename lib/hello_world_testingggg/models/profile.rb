# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Profiles#create
    class Profile < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute display_name
      #
      #   @return [String]
      required :display_name, String, api_name: :displayName

      # @!attribute audit_trail
      #   Free-form audit metadata retained from integrations.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :audit_trail,
               HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown],
               api_name: :auditTrail

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute legacy_code
      #   @deprecated
      #
      #   Deprecated external profile code.
      #
      #   @return [String, nil]
      optional :legacy_code, String, api_name: :legacyCode

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, HelloWorldTestingggg::Internal::Type::HashOf[String]

      # @!attribute phone_numbers
      #
      #   @return [Array<String>, nil]
      optional :phone_numbers,
               HelloWorldTestingggg::Internal::Type::ArrayOf[String],
               api_name: :phoneNumbers,
               nil?: true

      # @!attribute preferences
      #
      #   @return [HelloWorldTestingggg::Models::Profile::Preferences, nil]
      optional :preferences, -> { HelloWorldTestingggg::Profile::Preferences }

      response_only do
        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute version
        #
        #   @return [Integer]
        required :version, Integer
      end

      # @!method initialize(id:, created_at:, display_name:, updated_at:, version:, audit_trail: nil, email: nil, legacy_code: nil, metadata: nil, phone_numbers: nil, preferences: nil)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param display_name [String]
      #
      #   @param updated_at [Time]
      #
      #   @param version [Integer]
      #
      #   @param audit_trail [Hash{Symbol=>Object}] Free-form audit metadata retained from integrations.
      #
      #   @param email [String, nil]
      #
      #   @param legacy_code [String] Deprecated external profile code.
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param phone_numbers [Array<String>, nil]
      #
      #   @param preferences [HelloWorldTestingggg::Models::Profile::Preferences]

      # @see HelloWorldTestingggg::Models::Profile#preferences
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
