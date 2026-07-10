# typed: strong

module HelloWorldTestingggg
  module Models
    PetFindByTagsResponse =
      T.let(
        HelloWorldTestingggg::Internal::Type::ArrayOf[
          HelloWorldTestingggg::PetAPI
        ],
        HelloWorldTestingggg::Internal::Type::Converter
      )
  end
end
