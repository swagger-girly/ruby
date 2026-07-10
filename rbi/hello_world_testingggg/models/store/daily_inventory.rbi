# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class DailyInventory < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::DailyInventory,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Date) }
        attr_accessor :date

        sig { returns(T.anything) }
        attr_accessor :metrics

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :notes

        sig do
          params(
            date: Date,
            metrics: T.anything,
            notes: T.nilable(T::Array[String])
          ).returns(T.attached_class)
        end
        def self.new(date:, metrics:, notes: nil)
        end

        sig do
          override.returns(
            {
              date: Date,
              metrics: T.anything,
              notes: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
