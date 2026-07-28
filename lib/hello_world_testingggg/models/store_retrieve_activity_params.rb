# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Store#retrieve_activity
    class StoreRetrieveActivityParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute activity_id
      #
      #   @return [String]
      required :activity_id, String

      # @!method initialize(activity_id:, request_options: {})
      #   @param activity_id [String]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
