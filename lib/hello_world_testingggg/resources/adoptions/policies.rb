# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    class Adoptions
      # Adoption policies and applications
      class Policies
        # Creates an adoption policy from a set of eligibility rules, regional overrides,
        # and an optional escalation rule group.
        #
        # @overload create(name:, rules:, escalation: nil, fee_cap: nil, notification_target: nil, regional_overrides: nil, request_options: {})
        #
        # @param name [String]
        #
        # @param rules [Array<HelloWorldTestingggg::Models::Adoptions::AdoptionRule>]
        #
        # @param escalation [HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::Escalation]
        #
        # @param fee_cap [HelloWorldTestingggg::Models::Money]
        #
        # @param notification_target [String, HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams::NotificationTarget::WebhookSink] Where policy decisions are delivered: a plain email address or a webhook sink.
        #
        # @param regional_overrides [Hash{Symbol=>String, Integer, Float, Array<String>, Time}]
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Models::Adoptions::Policy]
        #
        # @see HelloWorldTestingggg::Models::Adoptions::PolicyCreateParams
        def create(params)
          parsed, options = HelloWorldTestingggg::Adoptions::PolicyCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "adoptions/policies",
            body: parsed,
            model: HelloWorldTestingggg::Adoptions::Policy,
            options: options
          )
        end

        # Returns a single adoption policy.
        #
        # @overload retrieve(policy_id, request_options: {})
        #
        # @param policy_id [String] Policy identifier.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Models::Adoptions::Policy]
        #
        # @see HelloWorldTestingggg::Models::Adoptions::PolicyRetrieveParams
        def retrieve(policy_id, params = {})
          @client.request(
            method: :get,
            path: ["adoptions/policies/%1$s", policy_id],
            model: HelloWorldTestingggg::Adoptions::Policy,
            options: params[:request_options]
          )
        end

        # Updates either the policy details or its lifecycle state.
        #
        # @overload update(policy_id, body:, request_options: {})
        #
        # @param policy_id [String] Policy identifier.
        #
        # @param body [HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyDetailsUpdate, HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams::Body::AdoptionPolicyLifecycleUpdate]
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Models::Adoptions::Policy]
        #
        # @see HelloWorldTestingggg::Models::Adoptions::PolicyUpdateParams
        def update(policy_id, params)
          parsed, options = HelloWorldTestingggg::Adoptions::PolicyUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["adoptions/policies/%1$s", policy_id],
            body: parsed[:body],
            model: HelloWorldTestingggg::Adoptions::Policy,
            options: options
          )
        end

        # Returns a cursor-paginated list of adoption policies.
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String] Cursor from a previous response used to fetch the next page.
        #
        # @param limit [Integer] Maximum number of policies to return.
        #
        # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [HelloWorldTestingggg::Internal::CustomCursorPage<HelloWorldTestingggg::Models::Adoptions::Policy>]
        #
        # @see HelloWorldTestingggg::Models::Adoptions::PolicyListParams
        def list(params = {})
          parsed, options = HelloWorldTestingggg::Adoptions::PolicyListParams.dump_request(params)
          query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "adoptions/policies",
            query: query,
            page: HelloWorldTestingggg::Internal::CustomCursorPage,
            model: HelloWorldTestingggg::Adoptions::Policy,
            options: options
          )
        end

        # @api private
        #
        # @param client [HelloWorldTestingggg::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
