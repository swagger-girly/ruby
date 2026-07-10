# typed: strong

module HelloWorldTestingggg
  module Resources
    class Store
      # Access to Petstore orders
      class Reports
        # Access to Petstore orders
        sig do
          returns(HelloWorldTestingggg::Resources::Store::Reports::Inventory)
        end
        attr_reader :inventory

        # Returns a generated store report.
        sig do
          params(
            report_id: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Store::Report)
        end
        def retrieve(
          # Report identifier.
          report_id,
          request_options: {}
        )
        end

        # Returns a cursor-id paginated list of generated store reports.
        sig do
          params(
            ending_before: String,
            page_size: Integer,
            starting_after: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(
            HelloWorldTestingggg::Internal::ReportCursorPage[
              HelloWorldTestingggg::Store::Report
            ]
          )
        end
        def list(
          # Return reports before this report id.
          ending_before: nil,
          # Maximum number of reports to return.
          page_size: nil,
          # Return reports after this report id.
          starting_after: nil,
          request_options: {}
        )
        end

        # Returns an embeddable HTML representation of a store report.
        sig do
          params(
            report_id: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(String)
        end
        def embed(
          # Report identifier.
          report_id,
          request_options: {}
        )
        end

        # Pauses a report generation job and returns an empty success response.
        sig do
          params(
            report_id: String,
            idempotency_key: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).void
        end
        def pause(
          # Report identifier.
          report_id,
          # Unique key used to safely retry report mutations.
          idempotency_key: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
