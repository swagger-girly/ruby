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

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
