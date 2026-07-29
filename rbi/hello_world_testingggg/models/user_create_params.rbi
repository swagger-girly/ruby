# typed: strong

module HelloWorldTestingggg
  module Models
    class UserCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::UserCreateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

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

      sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
      attr_reader :related_address

      sig do
        params(related_address: HelloWorldTestingggg::Address::OrHash).void
      end
      attr_writer :related_address

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_category

      sig { params(related_category: T.anything).void }
      attr_writer :related_category

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_customer

      sig { params(related_customer: T.anything).void }
      attr_writer :related_customer

      sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
      attr_reader :related_money

      sig { params(related_money: HelloWorldTestingggg::Money::OrHash).void }
      attr_writer :related_money

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_order

      sig { params(related_order: T.anything).void }
      attr_writer :related_order

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
      attr_reader :related_pet

      sig { params(related_pet: HelloWorldTestingggg::PetAPI::OrHash).void }
      attr_writer :related_pet

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_shelter

      sig { params(related_shelter: T.anything).void }
      attr_writer :related_shelter

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_tag

      sig { params(related_tag: T.anything).void }
      attr_writer :related_tag

      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      # User Status
      sig { returns(T.nilable(Integer)) }
      attr_reader :user_status

      sig { params(user_status: Integer).void }
      attr_writer :user_status

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            id: Integer,
            email: String,
            first_name: String,
            last_name: String,
            password: String,
            phone: String,
            related_address: HelloWorldTestingggg::Address,
            related_category: T.anything,
            related_customer: T.anything,
            related_money: HelloWorldTestingggg::Money,
            related_order: T.anything,
            related_pet: HelloWorldTestingggg::PetAPI,
            related_shelter: T.anything,
            related_tag: T.anything,
            username: String,
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
