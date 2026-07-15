# typed: strong

module HelloWorldTestingggg
  module Resources
    # Adoption policies and applications
    class Adoptions
      # Adoption policies and applications
      sig { returns(HelloWorldTestingggg::Resources::Adoptions::Policies) }
      attr_reader :policies

      # Submits an adoption application for an individual or an organization applicant.
      sig do
        params(
          body:
            T.any(
              HelloWorldTestingggg::AdoptionCreateParams::Body::Individual::OrHash,
              HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::OrHash
            ),
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Application)
      end
      def create(body:, request_options: {})
      end

      # Returns a single adoption application.
      sig do
        params(
          application_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Application)
      end
      def retrieve(
        # Application identifier.
        application_id,
        request_options: {}
      )
      end

      # Returns the decision for an application. The decision shape depends on the
      # outcome and carries no discriminator mapping.
      sig do
        params(
          application_id: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Models::AdoptionRetrieveDecisionResponse::Variants
        )
      end
      def retrieve_decision(
        # Application identifier.
        application_id,
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
