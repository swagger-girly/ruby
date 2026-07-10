# typed: strong

module HelloWorldTestingggg
  module Models
    class StoreReportGeneratedWebhookEvent < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::StoreReportGeneratedWebhookEvent,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T.anything) }
      attr_accessor :metrics

      sig { returns(HelloWorldTestingggg::Store::Report) }
      attr_reader :report

      sig { params(report: HelloWorldTestingggg::Store::Report::OrHash).void }
      attr_writer :report

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          created_at: Time,
          metrics: T.anything,
          report: HelloWorldTestingggg::Store::Report::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        metrics:,
        report:,
        type: :"store.report.generated"
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            metrics: T.anything,
            report: HelloWorldTestingggg::Store::Report,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
