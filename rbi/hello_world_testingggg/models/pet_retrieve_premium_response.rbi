# typed: strong

module HelloWorldTestingggg
  module Models
    class PetRetrievePremiumResponse < HelloWorldTestingggg::Models::PetAPI
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Time) }
      attr_accessor :premium_since

      # Coverage limit in minor units, or a negotiated custom limit.
      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::Variants
          )
        )
      end
      attr_reader :coverage_limit

      sig do
        params(
          coverage_limit:
            T.any(
              Integer,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit::OrHash
            )
        ).void
      end
      attr_writer :coverage_limit

      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance
          )
        )
      end
      attr_reader :insurance

      sig do
        params(
          insurance:
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::OrHash
        ).void
      end
      attr_writer :insurance

      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree
          )
        )
      end
      attr_reader :pedigree

      sig do
        params(
          pedigree:
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree::OrHash
        ).void
      end
      attr_writer :pedigree

      # A pet extended with premium-tier pedigree and insurance details.
      sig do
        params(
          premium_since: Time,
          coverage_limit:
            T.any(
              Integer,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit::OrHash
            ),
          insurance:
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::OrHash,
          pedigree:
            HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        premium_since:,
        # Coverage limit in minor units, or a negotiated custom limit.
        coverage_limit: nil,
        insurance: nil,
        pedigree: nil
      )
      end

      sig do
        override.returns(
          {
            premium_since: Time,
            coverage_limit:
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::Variants,
            insurance:
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance,
            pedigree:
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree
          }
        )
      end
      def to_hash
      end

      # Coverage limit in minor units, or a negotiated custom limit.
      module CoverageLimit
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Integer,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit
            )
          end

        class CustomLimit < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :amount

          sig { returns(T.nilable(String)) }
          attr_reader :currency

          sig { params(currency: String).void }
          attr_writer :currency

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :negotiated

          sig { params(negotiated: T::Boolean).void }
          attr_writer :negotiated

          sig do
            params(
              amount: Integer,
              currency: String,
              negotiated: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(amount:, currency: nil, negotiated: nil)
          end

          sig do
            override.returns(
              { amount: Integer, currency: String, negotiated: T::Boolean }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class Insurance < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :plan_id

        sig { returns(String) }
        attr_accessor :provider

        sig { returns(T.nilable(Integer)) }
        attr_reader :deductible

        sig { params(deductible: Integer).void }
        attr_writer :deductible

        sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
        attr_reader :premium

        sig { params(premium: HelloWorldTestingggg::Money::OrHash).void }
        attr_writer :premium

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
            )
          )
        end
        attr_reader :tier

        sig do
          params(
            tier:
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::OrSymbol
          ).void
        end
        attr_writer :tier

        sig do
          params(
            plan_id: String,
            provider: String,
            deductible: Integer,
            premium: HelloWorldTestingggg::Money::OrHash,
            tier:
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          plan_id:,
          provider:,
          deductible: nil,
          premium: nil,
          tier: nil
        )
        end

        sig do
          override.returns(
            {
              plan_id: String,
              provider: String,
              deductible: Integer,
              premium: HelloWorldTestingggg::Money,
              tier:
                HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Tier
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASIC =
            T.let(
              :basic,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
            )
          PLUS =
            T.let(
              :plus,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
            )
          PLATINUM =
            T.let(
              :platinum,
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Pedigree < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :certified

        sig { params(certified: T::Boolean).void }
        attr_writer :certified

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :lineage

        sig { params(lineage: T::Array[String]).void }
        attr_writer :lineage

        sig { returns(T.nilable(String)) }
        attr_reader :registry

        sig { params(registry: String).void }
        attr_writer :registry

        sig do
          params(
            certified: T::Boolean,
            lineage: T::Array[String],
            registry: String
          ).returns(T.attached_class)
        end
        def self.new(certified: nil, lineage: nil, registry: nil)
        end

        sig do
          override.returns(
            {
              certified: T::Boolean,
              lineage: T::Array[String],
              registry: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
