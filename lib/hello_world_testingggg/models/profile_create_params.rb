# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Profiles#create
    class ProfileCreateParams < HelloWorldTestingggg::Models::ProfileCreateRequest
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(idempotency_key: nil, request_options: {})
      #   @param idempotency_key [String]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
