# typed: strong

module HelloWorldTestingggg
  module Resources
    # Operations about user
    class User
      # This can only be done by the logged in user.
      sig do
        params(
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          related_address: HelloWorldTestingggg::Address::OrHash,
          related_category: T.anything,
          related_customer: T.anything,
          related_money: HelloWorldTestingggg::Money::OrHash,
          related_order: T.anything,
          related_pet: HelloWorldTestingggg::PetAPI::OrHash,
          related_shelter: T.anything,
          related_tag: T.anything,
          username: String,
          user_status: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::UserCreateResponse)
      end
      def create(
        id: nil,
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        phone: nil,
        related_address: nil,
        related_category: nil,
        related_customer: nil,
        related_money: nil,
        related_order: nil,
        related_pet: nil,
        related_shelter: nil,
        related_tag: nil,
        username: nil,
        # User Status
        user_status: nil,
        request_options: {}
      )
      end

      # Get user by user name
      sig do
        params(
          username: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::UserRetrieveResponse)
      end
      def retrieve(
        # The name that needs to be fetched. Use user1 for testing.
        username,
        request_options: {}
      )
      end

      # This can only be done by the logged in user.
      sig do
        params(
          path_username: String,
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          related_address: HelloWorldTestingggg::Address::OrHash,
          related_category: T.anything,
          related_customer: T.anything,
          related_money: HelloWorldTestingggg::Money::OrHash,
          related_order: T.anything,
          related_pet: HelloWorldTestingggg::PetAPI::OrHash,
          related_shelter: T.anything,
          related_tag: T.anything,
          body_username: String,
          user_status: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def update(
        # name that needs to be updated
        path_username,
        id: nil,
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        phone: nil,
        related_address: nil,
        related_category: nil,
        related_customer: nil,
        related_money: nil,
        related_order: nil,
        related_pet: nil,
        related_shelter: nil,
        related_tag: nil,
        body_username: nil,
        # User Status
        user_status: nil,
        request_options: {}
      )
      end

      # This can only be done by the logged in user.
      sig do
        params(
          username: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The name that needs to be deleted
        username,
        request_options: {}
      )
      end

      # Creates list of users with given input array
      sig do
        params(
          body:
            T::Array[
              HelloWorldTestingggg::UserCreateWithListParams::Body::OrHash
            ],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Models::UserCreateWithListResponse)
      end
      def create_with_list(body: nil, request_options: {})
      end

      # Logs user into the system
      sig do
        params(
          password: String,
          username: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(String)
      end
      def login(
        # The password for login in clear text
        password: nil,
        # The user name for login
        username: nil,
        request_options: {}
      )
      end

      # Logs out current logged in user session
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def logout(request_options: {})
      end

      # Casing probe replicating lithic: inline oneOf response whose variant is a
      # kebab-named component (kyb-kyc-verification) so adjacent default initialisms
      # glue into KYBKYC in the operation-scoped variant name
      sig do
        params(
          username: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(
          HelloWorldTestingggg::Models::UserVerifyIdentityResponse::Variants
        )
      end
      def verify_identity(username, request_options: {})
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
