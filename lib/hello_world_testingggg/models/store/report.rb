# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    module Store
      # @see HelloWorldTestingggg::Resources::Store::Reports#retrieve
      class Report < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::Store::Report::Status]
        required :status, enum: -> { HelloWorldTestingggg::Store::Report::Status }

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        optional :completed_at, Time, api_name: :completedAt, nil?: true

        # @!attribute filters
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :filters,
                 HelloWorldTestingggg::Internal::Type::HashOf[HelloWorldTestingggg::Internal::Type::Unknown]

        # @!attribute totals
        #
        #   @return [Hash{Symbol=>Integer}, nil]
        optional :totals, HelloWorldTestingggg::Internal::Type::HashOf[Integer]

        # @!method initialize(id:, created_at:, status:, completed_at: nil, filters: nil, totals: nil)
        #   @param id [String]
        #   @param created_at [Time]
        #   @param status [Symbol, HelloWorldTestingggg::Models::Store::Report::Status]
        #   @param completed_at [Time, nil]
        #   @param filters [Hash{Symbol=>Object}]
        #   @param totals [Hash{Symbol=>Integer}]

        # @see HelloWorldTestingggg::Models::Store::Report#status
        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          QUEUED = :queued
          RUNNING = :running
          COMPLETE = :complete
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
