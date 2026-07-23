# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Notifications
      # @see HelloWorldTestingggg::Resources::Notifications::Webhooks#parse_pet
      class WebhookParsePetParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
