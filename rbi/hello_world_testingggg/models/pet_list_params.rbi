# typed: strong

module HelloWorldTestingggg
  module Models
    class PetListParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetListParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
      sig { returns(T.nilable(HelloWorldTestingggg::PetListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: HelloWorldTestingggg::PetListParams::CreatedAt::OrHash
        ).void
      end
      attr_writer :created_at

      # Cursor from a previous response used to fetch the next page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of pets to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          created_at: HelloWorldTestingggg::PetListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
        created_at: nil,
        # Cursor from a previous response used to fetch the next page.
        cursor: nil,
        # Maximum number of pets to return.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: HelloWorldTestingggg::PetListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetListParams::CreatedAt,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # Minimum value to filter by (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :gt

        sig { params(gt: Time).void }
        attr_writer :gt

        # Minimum value to filter by (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :gte

        sig { params(gte: Time).void }
        attr_writer :gte

        # Maximum value to filter by (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :lt

        sig { params(lt: Time).void }
        attr_writer :lt

        # Maximum value to filter by (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :lte

        sig { params(lte: Time).void }
        attr_writer :lte

        # Filter by created_at timestamp range in UTC. Accepts gt/gte/lt/lte.
        sig do
          params(gt: Time, gte: Time, lt: Time, lte: Time).returns(
            T.attached_class
          )
        end
        def self.new(
          # Minimum value to filter by (exclusive).
          gt: nil,
          # Minimum value to filter by (inclusive).
          gte: nil,
          # Maximum value to filter by (exclusive).
          lt: nil,
          # Maximum value to filter by (inclusive).
          lte: nil
        )
        end

        sig { override.returns({ gt: Time, gte: Time, lt: Time, lte: Time }) }
        def to_hash
        end
      end
    end
  end
end
