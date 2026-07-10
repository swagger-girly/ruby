# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      module Reports
        module Inventory
          class DailyRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
            extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
            include HelloWorldTestingggg::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Store::Reports::Inventory::DailyRetrieveParams,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :report_id

            sig { returns(Date) }
            attr_accessor :date

            sig do
              params(
                report_id: String,
                date: Date,
                request_options: HelloWorldTestingggg::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(report_id:, date:, request_options: {})
            end

            sig do
              override.returns(
                {
                  report_id: String,
                  date: Date,
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
  end
end
