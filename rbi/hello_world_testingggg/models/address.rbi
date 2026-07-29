# typed: strong

module HelloWorldTestingggg
  module Models
    class Address < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Address,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :city

      sig { params(city: String).void }
      attr_writer :city

      sig { returns(T.nilable(HelloWorldTestingggg::Address::Geo)) }
      attr_reader :geo

      sig { params(geo: HelloWorldTestingggg::Address::Geo::OrHash).void }
      attr_writer :geo

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

      sig { params(related_money: HelloWorldTestingggg::Money).void }
      attr_writer :related_money

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_order

      sig { params(related_order: T.anything).void }
      attr_writer :related_order

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
      attr_reader :related_pet

      sig { params(related_pet: HelloWorldTestingggg::PetAPI).void }
      attr_writer :related_pet

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_shelter

      sig { params(related_shelter: T.anything).void }
      attr_writer :related_shelter

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_tag

      sig { params(related_tag: T.anything).void }
      attr_writer :related_tag

      sig { returns(T.nilable(T.anything)) }
      attr_reader :related_user

      sig { params(related_user: T.anything).void }
      attr_writer :related_user

      sig { returns(T.nilable(String)) }
      attr_reader :state

      sig { params(state: String).void }
      attr_writer :state

      sig { returns(T.nilable(String)) }
      attr_reader :street

      sig { params(street: String).void }
      attr_writer :street

      sig { returns(T.nilable(String)) }
      attr_reader :zip

      sig { params(zip: String).void }
      attr_writer :zip

      sig do
        params(
          city: String,
          geo: HelloWorldTestingggg::Address::Geo::OrHash,
          related_category: T.anything,
          related_customer: T.anything,
          related_money: HelloWorldTestingggg::Money,
          related_order: T.anything,
          related_pet: HelloWorldTestingggg::PetAPI,
          related_shelter: T.anything,
          related_tag: T.anything,
          related_user: T.anything,
          state: String,
          street: String,
          zip: String
        ).returns(T.attached_class)
      end
      def self.new(
        city: nil,
        geo: nil,
        related_category: nil,
        related_customer: nil,
        related_money: nil,
        related_order: nil,
        related_pet: nil,
        related_shelter: nil,
        related_tag: nil,
        related_user: nil,
        state: nil,
        street: nil,
        zip: nil
      )
      end

      sig do
        override.returns(
          {
            city: String,
            geo: HelloWorldTestingggg::Address::Geo,
            related_category: T.anything,
            related_customer: T.anything,
            related_money: HelloWorldTestingggg::Money,
            related_order: T.anything,
            related_pet: HelloWorldTestingggg::PetAPI,
            related_shelter: T.anything,
            related_tag: T.anything,
            related_user: T.anything,
            state: String,
            street: String,
            zip: String
          }
        )
      end
      def to_hash
      end

      class Geo < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Address::Geo,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Float) }
        attr_accessor :latitude

        sig { returns(Float) }
        attr_accessor :longitude

        sig do
          params(latitude: Float, longitude: Float).returns(T.attached_class)
        end
        def self.new(latitude:, longitude:)
        end

        sig { override.returns({ latitude: Float, longitude: Float }) }
        def to_hash
        end
      end
    end
  end
end
