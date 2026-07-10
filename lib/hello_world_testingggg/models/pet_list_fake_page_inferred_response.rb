# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Pet#list_fake_page_inferred
    class PetListFakePageInferredResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<HelloWorldTestingggg::Models::PetAPI>]
      required :data, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::PetAPI] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, HelloWorldTestingggg::Internal::Type::Boolean

      # @!method initialize(data:, has_more:)
      #   @param data [Array<HelloWorldTestingggg::Models::PetAPI>]
      #   @param has_more [Boolean]
    end
  end
end
