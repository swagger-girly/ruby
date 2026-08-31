# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # Operations about user
    class User
      # This can only be done by the logged in user.
      #
      # @overload create(id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_tag: nil, username: nil, user_status: nil, request_options: {})
      #
      # @param id [Integer]
      #
      # @param email [String]
      #
      # @param first_name [String]
      #
      # @param last_name [String]
      #
      # @param password [String]
      #
      # @param phone [String]
      #
      # @param related_address [HelloWorldTestingggg::Models::Address]
      #
      # @param related_category [Object]
      #
      # @param related_customer [Object]
      #
      # @param related_money [HelloWorldTestingggg::Models::Money]
      #
      # @param related_order [Object]
      #
      # @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #
      # @param related_shelter [Object]
      #
      # @param related_tag [Object]
      #
      # @param username [String]
      #
      # @param user_status [Integer] User Status
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::UserCreateResponse]
      #
      # @see HelloWorldTestingggg::Models::UserCreateParams
      def create(params = {})
        parsed, options = HelloWorldTestingggg::UserCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "user",
          body: parsed,
          model: HelloWorldTestingggg::Models::UserCreateResponse,
          options: options
        )
      end

      # Get user by user name
      #
      # @overload retrieve(username, request_options: {})
      #
      # @param username [String] The name that needs to be fetched. Use user1 for testing.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::UserRetrieveResponse]
      #
      # @see HelloWorldTestingggg::Models::UserRetrieveParams
      def retrieve(username, params = {})
        @client.request(
          method: :get,
          path: ["user/%1$s", username],
          model: HelloWorldTestingggg::Models::UserRetrieveResponse,
          options: params[:request_options]
        )
      end

      # This can only be done by the logged in user.
      #
      # @overload update(path_username, id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_shelter: nil, related_tag: nil, body_username: nil, user_status: nil, request_options: {})
      #
      # @param path_username [String] name that needs to be updated
      #
      # @param id [Integer]
      #
      # @param email [String]
      #
      # @param first_name [String]
      #
      # @param last_name [String]
      #
      # @param password [String]
      #
      # @param phone [String]
      #
      # @param related_address [HelloWorldTestingggg::Models::Address]
      #
      # @param related_category [Object]
      #
      # @param related_customer [Object]
      #
      # @param related_money [HelloWorldTestingggg::Models::Money]
      #
      # @param related_order [Object]
      #
      # @param related_pet [HelloWorldTestingggg::Models::PetAPI]
      #
      # @param related_shelter [Object]
      #
      # @param related_tag [Object]
      #
      # @param body_username [String]
      #
      # @param user_status [Integer] User Status
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::UserUpdateParams
      def update(path_username, params = {})
        parsed, options = HelloWorldTestingggg::UserUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["user/%1$s", path_username],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # This can only be done by the logged in user.
      #
      # @overload delete(username, request_options: {})
      #
      # @param username [String] The name that needs to be deleted
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::UserDeleteParams
      def delete(username, params = {})
        @client.request(
          method: :delete,
          path: ["user/%1$s", username],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Creates list of users with given input array
      #
      # @overload create_with_list(body: nil, request_options: {})
      #
      # @param body [Array<HelloWorldTestingggg::Models::UserCreateWithListParams::Body>]
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::UserCreateWithListResponse]
      #
      # @see HelloWorldTestingggg::Models::UserCreateWithListParams
      def create_with_list(params = {})
        parsed, options = HelloWorldTestingggg::UserCreateWithListParams.dump_request(params)
        @client.request(
          method: :post,
          path: "user/createWithList",
          body: parsed[:body],
          model: HelloWorldTestingggg::Models::UserCreateWithListResponse,
          options: options
        )
      end

      # Logs user into the system
      #
      # @overload login(password: nil, username: nil, request_options: {})
      #
      # @param password [String] The password for login in clear text
      #
      # @param username [String] The user name for login
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see HelloWorldTestingggg::Models::UserLoginParams
      def login(params = {})
        parsed, options = HelloWorldTestingggg::UserLoginParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "user/login",
          query: query,
          headers: {"accept" => "text/plain"},
          model: String,
          options: options
        )
      end

      # Logs out current logged in user session
      #
      # @overload logout(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::UserLogoutParams
      def logout(params = {})
        @client.request(method: :get, path: "user/logout", model: NilClass, options: params[:request_options])
      end

      # Casing probe replicating lithic: inline oneOf response whose variant is a
      # kebab-named component (kyb-kyc-verification) so adjacent default initialisms
      # glue into KYBKYC in the operation-scoped variant name
      #
      # @overload verify_identity(username, request_options: {})
      #
      # @param username [String]
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification, HelloWorldTestingggg::Models::UserVerifyIdentityResponse::BasicVerification]
      #
      # @see HelloWorldTestingggg::Models::UserVerifyIdentityParams
      def verify_identity(username, params = {})
        @client.request(
          method: :post,
          path: ["user/%1$s/verifyIdentity", username],
          model: HelloWorldTestingggg::Models::UserVerifyIdentityResponse,
          options: params[:request_options]
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
