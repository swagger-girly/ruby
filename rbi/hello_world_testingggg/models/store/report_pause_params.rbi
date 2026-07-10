# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class ReportPauseParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::ReportPauseParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :report_id

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig do
          params(
            report_id: String,
            idempotency_key: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(report_id:, idempotency_key: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              report_id: String,
              idempotency_key: String,
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
