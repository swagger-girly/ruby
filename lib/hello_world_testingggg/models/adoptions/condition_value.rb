# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Adoptions
      # A regex string, to be used with `MATCHES`
      module ConditionValue
        extend HelloWorldTestingggg::Internal::Type::Union

        # A regex string, to be used with `MATCHES`
        variant String

        variant Integer

        variant Float

        # An array of strings, to be used with `IS_ONE_OF` or `IS_NOT_ONE_OF`
        variant -> { HelloWorldTestingggg::Models::Adoptions::ConditionValue::StringArray }

        # A timestamp, to be used with `IS_BEFORE` or `IS_AFTER`
        variant Time

        # @!method self.variants
        #   @return [Array(String, Integer, Float, Array<String>, Time)]

        # @type [HelloWorldTestingggg::Internal::Type::Converter]
        StringArray = HelloWorldTestingggg::Internal::Type::ArrayOf[String]
      end
    end
  end
end
