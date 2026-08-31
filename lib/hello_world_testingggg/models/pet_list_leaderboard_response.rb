# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class PetListLeaderboardResponseItem < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute pet_id
      #   Ranked pet ID
      #
      #   @return [Integer]
      required :pet_id, Integer, api_name: :petId

      # @!attribute badge
      #
      #   @return [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge, nil]
      optional :badge, -> { HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge }

      # @!attribute docs_ref
      #   Docs anchor for the badge a leaderboard entry was awarded.
      #
      #   @return [Symbol, HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef, nil]
      optional :docs_ref,
               enum: -> { HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef },
               api_name: :docsRef

      # @!attribute rank
      #   Leaderboard position
      #
      #   @return [Integer, nil]
      optional :rank, Integer

      # @!attribute roi
      #   Adoption return on investment
      #
      #   @return [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi, nil]
      optional :roi, -> { HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi }

      # @!attribute seven_day_streak
      #   Consecutive days on the leaderboard.
      #
      #   @return [Integer, nil]
      optional :seven_day_streak, Integer, api_name: :streak7d

      # @!method initialize(pet_id:, badge: nil, docs_ref: nil, rank: nil, roi: nil, seven_day_streak: nil)
      #   @param pet_id [Integer] Ranked pet ID
      #
      #   @param badge [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge]
      #
      #   @param docs_ref [Symbol, HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef] Docs anchor for the badge a leaderboard entry was awarded.
      #
      #   @param rank [Integer] Leaderboard position
      #
      #   @param roi [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi] Adoption return on investment
      #
      #   @param seven_day_streak [Integer] Consecutive days on the leaderboard.

      # @see HelloWorldTestingggg::Models::PetListLeaderboardResponseItem#badge
      class Badge < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!method initialize
      end

      # Docs anchor for the badge a leaderboard entry was awarded.
      #
      # @see HelloWorldTestingggg::Models::PetListLeaderboardResponseItem#docs_ref
      module DocsRef
        extend HelloWorldTestingggg::Internal::Type::Enum

        TOP_ADOPTER = :"https://docs.petstore.example/leaderboard#top-adopter"
        RISING_STAR = :"https://docs.petstore.example/leaderboard#rising-star"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see HelloWorldTestingggg::Models::PetListLeaderboardResponseItem#roi
      class Roi < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute currency
        #
        #   @return [String, nil]
        optional :currency, String

        # @!attribute times
        #
        #   @return [Float, nil]
        optional :times, Float

        # @!method initialize(currency: nil, times: nil)
        #   Adoption return on investment
        #
        #   @param currency [String]
        #   @param times [Float]
      end
    end

    # @type [HelloWorldTestingggg::Internal::Type::Converter]
    PetListLeaderboardResponse =
      HelloWorldTestingggg::Internal::Type::ArrayOf[-> { HelloWorldTestingggg::Models::PetListLeaderboardResponseItem }]
  end
end
