# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # @see HelloWorldTestingggg::Resources::Adoptions::Policies#retrieve
      class PolicyRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        # @!attribute policy_id
        #
        #   @return [String]
        required :policy_id, String

        # @!method initialize(policy_id:, request_options: {})
        #   @param policy_id [String]
        #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
