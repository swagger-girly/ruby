# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @type [HelloWorldTestingggg::Internal::Type::Converter]
    PetFindByStatusResponse =
      HelloWorldTestingggg::Internal::Type::ArrayOf[-> { HelloWorldTestingggg::PetAPI }]
  end
end
