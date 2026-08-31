# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#list
    class PetListParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute created_at
      #   Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
      #
      #   @return [HelloWorldTestingggg::Models::PetListParams::CreatedAt, nil]
      optional :created_at, -> { HelloWorldTestingggg::PetListParams::CreatedAt }

      # @!attribute cursor
      #   Cursor from a previous response used to fetch the next page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of pets to return.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(created_at: nil, cursor: nil, limit: nil, request_options: {})
      #   @param created_at [HelloWorldTestingggg::Models::PetListParams::CreatedAt] Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
      #
      #   @param cursor [String] Cursor from a previous response used to fetch the next page.
      #
      #   @param limit [Integer] Maximum number of pets to return.
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      class CreatedAt < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute gt
        #   Minimum value to filter by (exclusive).
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #   Minimum value to filter by (inclusive).
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #   Maximum value to filter by (exclusive).
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #   Maximum value to filter by (inclusive).
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
        #
        #   @param gt [Time] Minimum value to filter by (exclusive).
        #
        #   @param gte [Time] Minimum value to filter by (inclusive).
        #
        #   @param lt [Time] Maximum value to filter by (exclusive).
        #
        #   @param lte [Time] Maximum value to filter by (inclusive).
      end
    end
  end
end
