# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Adoption policies and applications
    class Adoptions
      # Adoption policies and applications
      # @return [HelloWorldTestingggg::Resources::Adoptions::Policies]
      attr_reader :policies

      # Submits an adoption application for an individual or an organization applicant.
      #
      # @overload create(body:, request_options: {})
      #
      # @param body [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Individual, HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization]
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Application]
      #
      # @see HelloWorldTestingggg::Models::AdoptionCreateParams
      def create(params)
        parsed, options = HelloWorldTestingggg::AdoptionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "adoptions/applications",
          body: parsed[:body],
          model: HelloWorldTestingggg::Application,
          options: options
        )
      end

      # Returns a single adoption application.
      #
      # @overload retrieve(application_id, request_options: {})
      #
      # @param application_id [String] Application identifier.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Application]
      #
      # @see HelloWorldTestingggg::Models::AdoptionRetrieveParams
      def retrieve(application_id, params = {})
        @client.request(
          method: :get,
          path: ["adoptions/applications/%1$s", application_id],
          model: HelloWorldTestingggg::Application,
          options: params[:request_options]
        )
      end

      # Returns the decision for an application. The decision shape depends on the
      # outcome and carries no discriminator mapping.
      #
      # @overload retrieve_decision(application_id, request_options: {})
      #
      # @param application_id [String] Application identifier.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionApproved, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionRejected, HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::DecisionEscalated]
      #
      # @see HelloWorldTestingggg::Models::AdoptionRetrieveDecisionParams
      def retrieve_decision(application_id, params = {})
        @client.request(
          method: :get,
          path: ["adoptions/applications/%1$s/decision", application_id],
          model: HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
        @policies = HelloWorldTestingggg::Resources::Adoptions::Policies.new(client: client)
      end
    end
  end
end
