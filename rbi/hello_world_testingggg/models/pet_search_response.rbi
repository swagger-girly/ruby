# typed: strong

module HelloWorldTestingggg
  module Models
    PetSearchResponse =
      T.let(
        HelloWorldTestingggg::Internal::Type::ArrayOf[
          HelloWorldTestingggg::PetAPI
        ],
        HelloWorldTestingggg::Internal::Type::Converter
      )
  end
end
