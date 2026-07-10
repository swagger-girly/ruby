# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class ReportListParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::ReportListParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # Return reports before this report id.
        sig { returns(T.nilable(String)) }
        attr_reader :ending_before

        sig { params(ending_before: String).void }
        attr_writer :ending_before

        # Maximum number of reports to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Return reports after this report id.
        sig { returns(T.nilable(String)) }
        attr_reader :starting_after

        sig { params(starting_after: String).void }
        attr_writer :starting_after

        sig do
          params(
            ending_before: String,
            page_size: Integer,
            starting_after: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return reports before this report id.
          ending_before: nil,
          # Maximum number of reports to return.
          page_size: nil,
          # Return reports after this report id.
          starting_after: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              ending_before: String,
              page_size: Integer,
              starting_after: String,
              request_options: HelloWorldTestingggg::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
