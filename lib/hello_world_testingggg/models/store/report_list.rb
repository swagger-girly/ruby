# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      class ReportList < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<HelloWorldTestingggg::Models::Store::Report>]
        required :data, -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Store::Report] }

        # @!attribute has_more
        #
        #   @return [Boolean]
        required :has_more, HelloWorldTestingggg::Internal::Type::Boolean

        # @!method initialize(data:, has_more:)
        #   @param data [Array<HelloWorldTestingggg::Models::Store::Report>]
        #   @param has_more [Boolean]
      end
    end
  end
end
