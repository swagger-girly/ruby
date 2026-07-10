# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::User#update
    class UserUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute path_username
      #
      #   @return [String]
      required :path_username, String

      # @!attribute id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute first_name
      #
      #   @return [String, nil]
      optional :first_name, String, api_name: :firstName

      # @!attribute last_name
      #
      #   @return [String, nil]
      optional :last_name, String, api_name: :lastName

      # @!attribute password
      #
      #   @return [String, nil]
      optional :password, String

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!attribute body_username
      #
      #   @return [String, nil]
      optional :body_username, String, api_name: :username

      # @!attribute user_status
      #   User Status
      #
      #   @return [Integer, nil]
      optional :user_status, Integer, api_name: :userStatus

      # @!method initialize(path_username:, id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, body_username: nil, user_status: nil, request_options: {})
      #   @param path_username [String]
      #
      #   @param id [Integer]
      #
      #   @param email [String]
      #
      #   @param first_name [String]
      #
      #   @param last_name [String]
      #
      #   @param password [String]
      #
      #   @param phone [String]
      #
      #   @param body_username [String]
      #
      #   @param user_status [Integer] User Status
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
