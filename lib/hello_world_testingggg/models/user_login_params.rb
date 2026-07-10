# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::User#login
    class UserLoginParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute password
      #   The password for login in clear text
      #
      #   @return [String, nil]
      optional :password, String

      # @!attribute username
      #   The user name for login
      #
      #   @return [String, nil]
      optional :username, String

      # @!method initialize(password: nil, username: nil, request_options: {})
      #   @param password [String] The password for login in clear text
      #
      #   @param username [String] The user name for login
      #
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
