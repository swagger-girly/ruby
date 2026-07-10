# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Profiles#legacy_search
    class ProfileLegacySearchParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute include_archived
      #   Whether archived profiles should be included.
      #
      #   @return [Boolean, nil]
      optional :include_archived, HelloWorldTestingggg::Internal::Type::Boolean

      # @!attribute q
      #   Legacy free-text search string.
      #
      #   @return [String, nil]
      optional :q, String

      # @!method initialize(include_archived: nil, q: nil, request_options: {})
      #   @param include_archived [Boolean] Whether archived profiles should be included.
      #
      #   @param q [String] Legacy free-text search string.
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
