# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#watch_status_streaming
    class PetWatchStatusParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute pet_id
      #
      #   @return [Integer]
      required :pet_id, Integer

      # @!attribute last_event_id
      #
      #   @return [String, nil]
      optional :last_event_id, String

      # @!method initialize(pet_id:, last_event_id: nil, request_options: {})
      #   @param pet_id [Integer]
      #   @param last_event_id [String]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
