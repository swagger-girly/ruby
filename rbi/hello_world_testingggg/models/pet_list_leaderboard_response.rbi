# typed: strong

module HelloWorldTestingggg
  module Models
    class PetListLeaderboardResponseItem < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Ranked pet ID
      sig { returns(Integer) }
      attr_accessor :pet_id

      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge
          )
        )
      end
      attr_reader :badge

      sig do
        params(
          badge:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge::OrHash
        ).void
      end
      attr_writer :badge

      # Leaderboard position
      sig { returns(T.nilable(Integer)) }
      attr_reader :rank

      sig { params(rank: Integer).void }
      attr_writer :rank

      # Adoption return on investment
      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi
          )
        )
      end
      attr_reader :roi

      sig do
        params(
          roi:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi::OrHash
        ).void
      end
      attr_writer :roi

      sig do
        params(
          pet_id: Integer,
          badge:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge::OrHash,
          rank: Integer,
          roi:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Ranked pet ID
        pet_id:,
        badge: nil,
        # Leaderboard position
        rank: nil,
        # Adoption return on investment
        roi: nil
      )
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            badge:
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge,
            rank: Integer,
            roi:
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi
          }
        )
      end
      def to_hash
      end

      class Badge < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class Roi < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :currency

        sig { params(currency: String).void }
        attr_writer :currency

        sig { returns(T.nilable(Float)) }
        attr_reader :times

        sig { params(times: Float).void }
        attr_writer :times

        # Adoption return on investment
        sig { params(currency: String, times: Float).returns(T.attached_class) }
        def self.new(currency: nil, times: nil)
        end

        sig { override.returns({ currency: String, times: Float }) }
        def to_hash
        end
      end
    end

    PetListLeaderboardResponse =
      T.let(
        HelloWorldTestingggg::Internal::Type::ArrayOf[
          HelloWorldTestingggg::Models::PetListLeaderboardResponseItem
        ],
        HelloWorldTestingggg::Internal::Type::Converter
      )
  end
end
