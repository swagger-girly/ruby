# typed: strong

module HelloWorldTestingggg
  module Models
    class RetrieveRateLimitsResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::RetrieveRateLimitsResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :remaining

      sig { returns(Time) }
      attr_accessor :reset_at

      sig do
        returns(
          T.nilable(
            T::Array[
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier
            ]
          )
        )
      end
      attr_reader :tiers

      sig do
        params(
          tiers:
            T::Array[
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::OrHash
            ]
        ).void
      end
      attr_writer :tiers

      sig do
        params(
          remaining: Integer,
          reset_at: Time,
          tiers:
            T::Array[
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(remaining:, reset_at:, tiers: nil)
      end

      sig do
        override.returns(
          {
            remaining: Integer,
            reset_at: Time,
            tiers:
              T::Array[
                HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier
              ]
          }
        )
      end
      def to_hash
      end

      class Tier < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota
            )
          )
        end
        attr_reader :quota

        sig do
          params(
            quota:
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota::OrHash
          ).void
        end
        attr_writer :quota

        sig do
          params(
            name: String,
            quota:
              HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota::OrHash
          ).returns(T.attached_class)
        end
        def self.new(name:, quota: nil)
        end

        sig do
          override.returns(
            {
              name: String,
              quota:
                HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota
            }
          )
        end
        def to_hash
        end

        class Quota < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::RetrieveRateLimitsResponse::Tier::Quota,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :requests

          sig { params(requests: Integer).void }
          attr_writer :requests

          sig { returns(T.nilable(String)) }
          attr_reader :window

          sig { params(window: String).void }
          attr_writer :window

          sig do
            params(requests: Integer, window: String).returns(T.attached_class)
          end
          def self.new(requests: nil, window: nil)
          end

          sig { override.returns({ requests: Integer, window: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
