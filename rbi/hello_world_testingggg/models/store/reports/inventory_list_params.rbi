# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      module Reports
        class InventoryListParams < HelloWorldTestingggg::Internal::Type::BaseModel
          extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
          include HelloWorldTestingggg::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Store::Reports::InventoryListParams,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :report_id

          sig do
            params(
              report_id: String,
              request_options: HelloWorldTestingggg::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(report_id:, request_options: {})
          end

          sig do
            override.returns(
              {
                report_id: String,
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
