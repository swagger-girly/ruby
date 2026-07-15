# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Client#retrieve_rate_limits
    class RetrieveRateLimitsResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute remaining
      #
      #   @return [Integer]
      required :remaining, Integer

      # @!attribute reset_at
      #
      #   @return [Time]
      required :reset_at, Time, api_name: :resetAt

      # @!attribute tiers
      #
      #   @return [Array<HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier>, nil]
      optional :tiers,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier] }

      # @!method initialize(remaining:, reset_at:, tiers: nil)
      #   @param remaining [Integer]
      #   @param reset_at [Time]
      #   @param tiers [Array<HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier>]

      class Tier < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute quota
        #
        #   @return [HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota, nil]
        optional :quota, -> { HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota }

        # @!method initialize(name:, quota: nil)
        #   @param name [String]
        #   @param quota [HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota]

        # @see HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier#quota
        class Quota < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute requests
          #
          #   @return [Integer, nil]
          optional :requests, Integer

          # @!attribute window
          #
          #   @return [String, nil]
          optional :window, String

          # @!method initialize(requests: nil, window: nil)
          #   @param requests [Integer]
          #   @param window [String]
        end
      end
    end
  end
end
