# typed: strong

module HelloWorldTestingggg
  module Models
    module Adoptions
      class PolicyRetrieveParams < HelloWorldTestingggg::Internal::Type::BaseModel
        extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
        include HelloWorldTestingggg::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Adoptions::PolicyRetrieveParams,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :policy_id

        sig do
          params(
            policy_id: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(policy_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              policy_id: String,
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
