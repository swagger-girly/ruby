# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#retrieve_premium
    class PetRetrievePremiumResponse < HelloWorldTestingggg::Models::PetAPI
      # @!attribute premium_since
      #
      #   @return [Time]
      required :premium_since, Time, api_name: :premiumSince

      # @!attribute coverage_limit
      #   Coverage limit in minor units, or a negotiated custom limit.
      #
      #   @return [Integer, HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit, nil]
      optional :coverage_limit,
               union: -> { HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit },
               api_name: :coverageLimit

      # @!attribute insurance
      #
      #   @return [HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance, nil]
      optional :insurance, -> { HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance }

      # @!attribute pedigree
      #
      #   @return [HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree, nil]
      optional :pedigree, -> { HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree }

      # @!method initialize(premium_since:, coverage_limit: nil, insurance: nil, pedigree: nil)
      #   A pet extended with premium-tier pedigree and insurance details.
      #
      #   @param premium_since [Time]
      #
      #   @param coverage_limit [Integer, HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit] Coverage limit in minor units, or a negotiated custom limit.
      #
      #   @param insurance [HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance]
      #
      #   @param pedigree [HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Pedigree]

      # Coverage limit in minor units, or a negotiated custom limit.
      module CoverageLimit
        extend HelloWorldTestingggg::Internal::Type::Union

        variant Integer

        variant -> { HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit }

        class CustomLimit < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute amount
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute currency
          #
          #   @return [String, nil]
          optional :currency, String

          # @!attribute negotiated
          #
          #   @return [Boolean, nil]
          optional :negotiated, HelloWorldTestingggg::Internal::Type::Boolean

          # @!method initialize(amount:, currency: nil, negotiated: nil)
          #   @param amount [Integer]
          #   @param currency [String]
          #   @param negotiated [Boolean]
        end

        # @!method self.variants
        #   @return [Array(Integer, HelloWorldTestingggg::Models::PetRetrievePremiumResponse::CoverageLimit::CustomLimit)]
      end

      class Insurance < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute plan_id
        #
        #   @return [String]
        required :plan_id, String, api_name: :planId

        # @!attribute provider
        #
        #   @return [String]
        required :provider, String

        # @!attribute deductible
        #
        #   @return [Integer, nil]
        optional :deductible, Integer

        # @!attribute premium
        #
        #   @return [HelloWorldTestingggg::Models::Money, nil]
        optional :premium, -> { HelloWorldTestingggg::Money }

        # @!attribute tier
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier, nil]
        optional :tier, enum: -> { HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier }

        # @!method initialize(plan_id:, provider:, deductible: nil, premium: nil, tier: nil)
        #   @param plan_id [String]
        #   @param provider [String]
        #   @param deductible [Integer]
        #   @param premium [HelloWorldTestingggg::Models::Money]
        #   @param tier [Symbol, HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance::Tier]

        # @see HelloWorldTestingggg::Models::PetRetrievePremiumResponse::Insurance#tier
        module Tier
          extend HelloWorldTestingggg::Internal::Type::Enum

          BASIC = :basic
          PLUS = :plus
          PLATINUM = :platinum

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Pedigree < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute certified
        #
        #   @return [Boolean, nil]
        optional :certified, HelloWorldTestingggg::Internal::Type::Boolean

        # @!attribute lineage
        #
        #   @return [Array<String>, nil]
        optional :lineage, HelloWorldTestingggg::Internal::Type::ArrayOf[String]

        # @!attribute registry
        #
        #   @return [String, nil]
        optional :registry, String

        # @!method initialize(certified: nil, lineage: nil, registry: nil)
        #   @param certified [Boolean]
        #   @param lineage [Array<String>]
        #   @param registry [String]
      end
    end
  end
end
