# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # The applicant or pet attribute the rule targets.
      module RuleAttribute
        extend HelloWorldTestingggg::Internal::Type::Enum

        PET_STATUS = :PET_STATUS
        SPECIES = :SPECIES
        ADOPTER_AGE = :ADOPTER_AGE
        REGION = :REGION
        PRIOR_ADOPTIONS = :PRIOR_ADOPTIONS
        APPLICATION_DATE = :APPLICATION_DATE

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
