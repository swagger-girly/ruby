# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class StoreReportGeneratedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute metrics
      #
      #   @return [Object]
      required :metrics, HelloWorldTestingggg::Internal::Type::Unknown

      # @!attribute report
      #
      #   @return [HelloWorldTestingggg::Models::Store::Report]
      required :report, -> { HelloWorldTestingggg::Store::Report }

      # @!attribute type
      #
      #   @return [Symbol, :"store.report.generated"]
      required :type, const: :"store.report.generated"

      # @!method initialize(id:, created_at:, metrics:, report:, type: :"store.report.generated")
      #   @param id [String]
      #   @param created_at [Time]
      #   @param metrics [Object]
      #   @param report [HelloWorldTestingggg::Models::Store::Report]
      #   @param type [Symbol, :"store.report.generated"]
    end
  end
end
