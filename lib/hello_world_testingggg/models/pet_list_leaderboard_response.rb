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

      # @!method initialize(pet_id:, badge: nil, rank: nil, roi: nil)
      #   @param pet_id [Integer] Ranked pet ID
      #
      #   @param badge [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge]
      #
      #   @param rank [Integer] Leaderboard position
      #
      #   @param roi [HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi] Adoption return on investment

      # @see HelloWorldTestingggg::Models::PetListLeaderboardResponseItem#badge
      class Badge < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!method initialize
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
