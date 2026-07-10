# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::User#create
    class UserCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

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

      # @!attribute username
      #
      #   @return [String, nil]
      optional :username, String

      # @!attribute user_status
      #   User Status
      #
      #   @return [Integer, nil]
      optional :user_status, Integer, api_name: :userStatus

      # @!method initialize(id: nil, email: nil, first_name: nil, last_name: nil, password: nil, phone: nil, username: nil, user_status: nil, request_options: {})
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
      #   @param username [String]
      #
      #   @param user_status [Integer] User Status
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
