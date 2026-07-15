# typed: strong

module HelloWorldTestingggg
  module Models
    AdoptionRule = Adoptions::AdoptionRule

    module Adoptions
      class AdoptionRule < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Adoptions::AdoptionRule,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # The applicant or pet attribute the rule targets.
        sig do
          returns(HelloWorldTestingggg::Adoptions::RuleAttribute::OrSymbol)
        end
        attr_accessor :attribute

        sig do
          returns(
            HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::OrSymbol
          )
        end
        attr_accessor :operation

        # A regex string, to be used with `MATCHES`
        sig do
          returns(
            T.nilable(HelloWorldTestingggg::Adoptions::ConditionValue::Variants)
          )
        end
        attr_reader :value

        sig do
          params(
            value: HelloWorldTestingggg::Adoptions::ConditionValue::Variants
          ).void
        end
        attr_writer :value

        sig do
          params(
            attribute: HelloWorldTestingggg::Adoptions::RuleAttribute::OrSymbol,
            operation:
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::OrSymbol,
            value: HelloWorldTestingggg::Adoptions::ConditionValue::Variants
          ).returns(T.attached_class)
        end
        def self.new(
          # The applicant or pet attribute the rule targets.
          attribute:,
          operation:,
          # A regex string, to be used with `MATCHES`
          value: nil
        )
        end

        sig do
          override.returns(
            {
              attribute:
                HelloWorldTestingggg::Adoptions::RuleAttribute::OrSymbol,
              operation:
                HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::OrSymbol,
              value: HelloWorldTestingggg::Adoptions::ConditionValue::Variants
            }
          )
        end
        def to_hash
        end

        module Operation
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Adoptions::AdoptionRule::Operation
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IS_ONE_OF =
            T.let(
              :IS_ONE_OF,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          IS_NOT_ONE_OF =
            T.let(
              :IS_NOT_ONE_OF,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          MATCHES =
            T.let(
              :MATCHES,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          IS_GREATER_THAN =
            T.let(
              :IS_GREATER_THAN,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          IS_LESS_THAN =
            T.let(
              :IS_LESS_THAN,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          IS_BEFORE =
            T.let(
              :IS_BEFORE,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )
          IS_AFTER =
            T.let(
              :IS_AFTER,
              HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Adoptions::AdoptionRule::Operation::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
