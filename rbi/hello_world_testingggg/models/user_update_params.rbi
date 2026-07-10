# typed: strong

module HelloWorldTestingggg
  module Models
    class UserUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::UserUpdateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :path_username

      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      sig { returns(T.nilable(String)) }
      attr_reader :first_name

      sig { params(first_name: String).void }
      attr_writer :first_name

      sig { returns(T.nilable(String)) }
      attr_reader :last_name

      sig { params(last_name: String).void }
      attr_writer :last_name

      sig { returns(T.nilable(String)) }
      attr_reader :password

      sig { params(password: String).void }
      attr_writer :password

      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      sig { returns(T.nilable(String)) }
      attr_reader :body_username

      sig { params(body_username: String).void }
      attr_writer :body_username

      # User Status
      sig { returns(T.nilable(Integer)) }
      attr_reader :user_status

      sig { params(user_status: Integer).void }
      attr_writer :user_status

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
        ).returns(T.attached_class)
      end
      def self.new(
        path_username:,
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

      sig do
        override.returns(
          {
            path_username: String,
            id: Integer,
            email: String,
            first_name: String,
            last_name: String,
            password: String,
            phone: String,
            body_username: String,
            user_status: Integer,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
