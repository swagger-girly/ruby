# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class Report < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::Report,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(HelloWorldTestingggg::Store::Report::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :filters

        sig { params(filters: T::Hash[Symbol, T.anything]).void }
        attr_writer :filters

        sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
        attr_reader :totals

        sig { params(totals: T::Hash[Symbol, Integer]).void }
        attr_writer :totals

        sig do
          params(
            id: String,
            created_at: Time,
            status: HelloWorldTestingggg::Store::Report::Status::OrSymbol,
            completed_at: T.nilable(Time),
            filters: T::Hash[Symbol, T.anything],
            totals: T::Hash[Symbol, Integer]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          status:,
          completed_at: nil,
          filters: nil,
          totals: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              status: HelloWorldTestingggg::Store::Report::Status::TaggedSymbol,
              completed_at: T.nilable(Time),
              filters: T::Hash[Symbol, T.anything],
              totals: T::Hash[Symbol, Integer]
            }
          )
        end
        def to_hash
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, HelloWorldTestingggg::Store::Report::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUEUED =
            T.let(
              :queued,
              HelloWorldTestingggg::Store::Report::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              HelloWorldTestingggg::Store::Report::Status::TaggedSymbol
            )
          COMPLETE =
            T.let(
              :complete,
              HelloWorldTestingggg::Store::Report::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              HelloWorldTestingggg::Store::Report::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Store::Report::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
