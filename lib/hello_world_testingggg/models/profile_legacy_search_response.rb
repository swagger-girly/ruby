# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @type [HelloWorldTestingggg::Internal::Type::Converter]
    ProfileLegacySearchResponse =
      HelloWorldTestingggg::Internal::Type::ArrayOf[-> { HelloWorldTestingggg::Profile }]
  end
end
