# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#search
    class PetSearchParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute filters
      #   Object-schema query parameter: mints a typed params model instead of collapsing
      #   to a bare object.
      #
      #   @return [HelloWorldTestingggg::Models::PetSearchParams::Filters, nil]
      optional :filters, -> { HelloWorldTestingggg::PetSearchParams::Filters }

      # @!attribute max_results
      #   Scalar query parameter: stays a plain scalar (control probe).
      #
      #   @return [Integer, nil]
      optional :max_results, Integer

      # @!attribute raw_filter
      #   Empty-object query parameter (additionalProperties:false): stays a bare object,
      #   exercising the empty-object branch.
      #
      #   @return [Object, nil]
      optional :raw_filter, HelloWorldTestingggg::Internal::Type::Unknown

      # @!attribute tag_filters
      #   Array-of-object query parameter: emitters mint a singularized element type for
      #   each item.
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetSearchParams::TagFilter>, nil]
      optional :tag_filters,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetSearchParams::TagFilter] }

      # @!method initialize(filters: nil, max_results: nil, raw_filter: nil, tag_filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {HelloWorldTestingggg::Models::PetSearchParams} for more details.
      #
      #   @param filters [HelloWorldTestingggg::Models::PetSearchParams::Filters] Object-schema query parameter: mints a typed params model instead of collapsing
      #
      #   @param max_results [Integer] Scalar query parameter: stays a plain scalar (control probe).
      #
      #   @param raw_filter [Object] Empty-object query parameter (additionalProperties:false): stays a bare object,
      #
      #   @param tag_filters [Array<HelloWorldTestingggg::Models::PetSearchParams::TagFilter>] Array-of-object query parameter: emitters mint a singularized element type for e
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      class Filters < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute color
        #
        #   @return [String, nil]
        optional :color, String

        # @!attribute size
        #
        #   @return [Integer, nil]
        optional :size, Integer

        # @!method initialize(color: nil, size: nil)
        #   Object-schema query parameter: mints a typed params model instead of collapsing
        #   to a bare object.
        #
        #   @param color [String]
        #   @param size [Integer]
      end

      class TagFilter < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute key
        #
        #   @return [String, nil]
        optional :key, String

        # @!attribute match
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::PetSearchParams::TagFilter::Match, nil]
        optional :match, enum: -> { HelloWorldTestingggg::PetSearchParams::TagFilter::Match }

        # @!method initialize(key: nil, match: nil)
        #   @param key [String]
        #   @param match [Symbol, HelloWorldTestingggg::Models::PetSearchParams::TagFilter::Match]

        # @see HelloWorldTestingggg::Models::PetSearchParams::TagFilter#match
        module Match
          extend HelloWorldTestingggg::Internal::Type::Enum

          EXACT = :exact
          PREFIX = :prefix

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
