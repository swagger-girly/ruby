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

      # Docs anchor for the badge a leaderboard entry was awarded.
      sig do
        returns(
          T.nilable(
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::TaggedSymbol
          )
        )
      end
      attr_reader :docs_ref

      sig do
        params(
          docs_ref:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::OrSymbol
        ).void
      end
      attr_writer :docs_ref

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

      # Consecutive days on the leaderboard.
      sig { returns(T.nilable(Integer)) }
      attr_reader :seven_day_streak

      sig { params(seven_day_streak: Integer).void }
      attr_writer :seven_day_streak

      sig do
        params(
          pet_id: Integer,
          badge:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge::OrHash,
          docs_ref:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::OrSymbol,
          rank: Integer,
          roi:
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi::OrHash,
          seven_day_streak: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Ranked pet ID
        pet_id:,
        badge: nil,
        # Docs anchor for the badge a leaderboard entry was awarded.
        docs_ref: nil,
        # Leaderboard position
        rank: nil,
        # Adoption return on investment
        roi: nil,
        # Consecutive days on the leaderboard.
        seven_day_streak: nil
      )
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            badge:
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Badge,
            docs_ref:
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::TaggedSymbol,
            rank: Integer,
            roi:
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::Roi,
            seven_day_streak: Integer
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

      # Docs anchor for the badge a leaderboard entry was awarded.
      module DocsRef
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOP_ADOPTER =
          T.let(
            :"https://docs.petstore.example/leaderboard#top-adopter",
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::TaggedSymbol
          )
        RISING_STAR =
          T.let(
            :"https://docs.petstore.example/leaderboard#rising-star",
            HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::Models::PetListLeaderboardResponseItem::DocsRef::TaggedSymbol
            ]
          )
        end
        def self.values
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
