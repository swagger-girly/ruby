# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @type [HelloWorldTestingggg::Internal::Type::Converter]
    PetSearchResponse = HelloWorldTestingggg::Internal::Type::ArrayOf[-> { HelloWorldTestingggg::PetAPI }]
  end
end
