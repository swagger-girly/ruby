# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#list_unpaginated
    class PetListUnpaginatedResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetAPI>]
      required :items, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI] }

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(items:, next_cursor: nil)
      #   @param items [Array<HelloWorldTestingggg::Models::PetAPI>]
      #   @param next_cursor [String, nil]
    end
  end
end
