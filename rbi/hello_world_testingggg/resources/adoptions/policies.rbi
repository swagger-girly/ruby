# typed: strong

module HelloWorldTestingggg
  module Resources
    class Adoptions
      # Adoption policies and applications
      class Policies
        # Creates an adoption policy from a set of eligibility rules, regional overrides,
        # and an optional escalation rule group.
        sig do
          params(
            name: String,
            rules:
              T::Array[HelloWorldTestingggg::Adoptions::AdoptionRule::OrHash],
            escalation:
              HelloWorldTestingggg::Adoptions::PolicyCreateParams::Escalation::OrHash,
            fee_cap: HelloWorldTestingggg::Money::OrHash,
            notification_target:
              T.any(
                String,
                HelloWorldTestingggg::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink::OrHash
              ),
            regional_overrides:
              T::Hash[
                Symbol,
                HelloWorldTestingggg::Adoptions::ConditionValue::Variants
              ],
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Adoptions::Policy)
        end
        def create(
          name:,
          rules:,
          escalation: nil,
          fee_cap: nil,
          # Where policy decisions are delivered: a plain email address or a webhook sink.
          notification_target: nil,
          regional_overrides: nil,
          request_options: {}
        )
        end

        # Returns a single adoption policy.
        sig do
          params(
            policy_id: String,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Adoptions::Policy)
        end
        def retrieve(
          # Policy identifier.
          policy_id,
          request_options: {}
        )
        end

        # Updates either the policy details or its lifecycle state.
        sig do
          params(
            policy_id: String,
            body:
              T.any(
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate::OrHash,
                HelloWorldTestingggg::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate::OrHash
              ),
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(HelloWorldTestingggg::Adoptions::Policy)
        end
        def update(
          # Policy identifier.
          policy_id,
          body:,
          request_options: {}
        )
        end

        # Returns a cursor-paginated list of adoption policies.
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: HelloWorldTestingggg::RequestOptions::OrHash
          ).returns(
            HelloWorldTestingggg::Internal::CustomCursorPage[
              HelloWorldTestingggg::Adoptions::Policy
            ]
          )
        end
        def list(
          # Cursor from a previous response used to fetch the next page.
          cursor: nil,
          # Maximum number of policies to return.
          limit: nil,
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
