# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Files#list
    class Fileslist < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<HelloWorldTestingggg::Models::File>]
      required :data, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::File] }

      # @!method initialize(data:)
      #   @param data [Array<HelloWorldTestingggg::Models::File>]
    end
  end
end
