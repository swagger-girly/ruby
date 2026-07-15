# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      class AdoptionRule < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute attribute
        #   The applicant or pet attribute the rule targets.
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::RuleAttribute]
        required :attribute, enum: -> { HelloWorldTestingggg::Adoptions::RuleAttribute }

        # @!attribute operation
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Adoptions::AdoptionRule::Operation]
        required :operation, enum: -> { HelloWorldTestingggg::Adoptions::AdoptionRule::Operation }

        # @!attribute value
        #   A regex string, to be used with `MATCHES`
        #
        #   @return [String, Integer, Float, Array<String>, Time, nil]
        optional :value, union: -> { HelloWorldTestingggg::Adoptions::ConditionValue }

        # @!method initialize(attribute:, operation:, value: nil)
        #   @param attribute [Symbol, HelloWorldTestingggg::Models::Adoptions::RuleAttribute] The applicant or pet attribute the rule targets.
        #
        #   @param operation [Symbol, HelloWorldTestingggg::Models::Adoptions::AdoptionRule::Operation]
        #
        #   @param value [String, Integer, Float, Array<String>, Time] A regex string, to be used with `MATCHES`

        # @see HelloWorldTestingggg::Models::Adoptions::AdoptionRule#operation
        module Operation
          extend HelloWorldTestingggg::Internal::Type::Enum

          IS_ONE_OF = :IS_ONE_OF
          IS_NOT_ONE_OF = :IS_NOT_ONE_OF
          MATCHES = :MATCHES
          IS_GREATER_THAN = :IS_GREATER_THAN
          IS_LESS_THAN = :IS_LESS_THAN
          IS_BEFORE = :IS_BEFORE
          IS_AFTER = :IS_AFTER

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    AdoptionRule = Adoptions::AdoptionRule
  end
end
