# typed: strong

module HelloWorldTestingggg
  module Models
    ProfileLegacySearchResponse =
      T.let(
        HelloWorldTestingggg::Internal::Type::ArrayOf[
          HelloWorldTestingggg::Profile
        ],
        HelloWorldTestingggg::Internal::Type::Converter
      )
  end
end
