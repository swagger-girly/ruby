# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      class DailyInventory < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute date
        #
        #   @return [Date]
        required :date, Date

        # @!attribute metrics
        #
        #   @return [Object]
        required :metrics, HelloWorldTestingggg::Internal::Type::Unknown

        # @!attribute notes
        #
        #   @return [Array<String>, nil]
        optional :notes, HelloWorldTestingggg::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(date:, metrics:, notes: nil)
        #   @param date [Date]
        #   @param metrics [Object]
        #   @param notes [Array<String>, nil]
      end
    end
  end
end
