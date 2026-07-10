# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Profiles#retrieve
    class ProfileRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!method initialize(profile_id:, request_options: {})
      #   @param profile_id [String]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
