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
          state: String,
          street: String,
          zip: String
        ).returns(T.attached_class)
      end
      def self.new(city: nil, geo: nil, state: nil, street: nil, zip: nil)
      end

      sig do
        override.returns(
          {
            city: String,
            geo: HelloWorldTestingggg::Address::Geo,
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
