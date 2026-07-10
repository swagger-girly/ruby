# typed: strong

module HelloWorldTestingggg
  module Models
    module Store
      class ReportList < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Store::ReportList,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T::Array[HelloWorldTestingggg::Store::Report]) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :has_more

        sig do
          params(
            data: T::Array[HelloWorldTestingggg::Store::Report::OrHash],
            has_more: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, has_more:)
        end

        sig do
          override.returns(
            {
              data: T::Array[HelloWorldTestingggg::Store::Report],
              has_more: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
