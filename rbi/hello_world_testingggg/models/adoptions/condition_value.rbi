# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      # A regex string, to be used with `MATCHES`
      module ConditionValue
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias { T.any(String, Integer, Float, T::Array[String], Time) }

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Adoptions::ConditionValue::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            HelloWorldTestingggg::Internal::Type::ArrayOf[String],
            HelloWorldTestingggg::Internal::Type::Converter
          )
      end
    end
  end
end
