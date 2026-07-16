# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      # The applicant or pet attribute the rule targets.
      module RuleAttribute
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::Adoptions::RuleAttribute)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PET_STATUS =
          T.let(
            :PET_STATUS,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )
        SPECIES =
          T.let(
            :SPECIES,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )
        ADOPTER_AGE =
          T.let(
            :ADOPTER_AGE,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )
        REGION =
          T.let(
            :REGION,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )
        PRIOR_ADOPTIONS =
          T.let(
            :PRIOR_ADOPTIONS,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )
        APPLICATION_DATE =
          T.let(
            :APPLICATION_DATE,
            HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::Adoptions::RuleAttribute::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
