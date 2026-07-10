# typed: strong

module HelloWorldTestingggg
  module Models
    class ProfileCreateRequest < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::ProfileCreateRequest,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :display_name

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig do
        returns(
          T.nilable(HelloWorldTestingggg::ProfileCreateRequest::Preferences)
        )
      end
      attr_reader :preferences

      sig do
        params(
          preferences:
            HelloWorldTestingggg::ProfileCreateRequest::Preferences::OrHash
        ).void
      end
      attr_writer :preferences

      # Compliance identifier used only during profile creation.
      sig { returns(T.nilable(String)) }
      attr_reader :government_id

      sig { params(government_id: String).void }
      attr_writer :government_id

      # Internal note that must not be emitted in profile responses.
      sig { returns(T.nilable(String)) }
      attr_reader :secret_note

      sig { params(secret_note: String).void }
      attr_writer :secret_note

      sig do
        params(
          display_name: String,
          email: T.nilable(String),
          government_id: String,
          metadata: T::Hash[Symbol, String],
          preferences:
            HelloWorldTestingggg::ProfileCreateRequest::Preferences::OrHash,
          secret_note: String
        ).returns(T.attached_class)
      end
      def self.new(
        display_name:,
        email: nil,
        # Compliance identifier used only during profile creation.
        government_id: nil,
        metadata: nil,
        preferences: nil,
        # Internal note that must not be emitted in profile responses.
        secret_note: nil
      )
      end

      sig do
        override.returns(
          {
            display_name: String,
            email: T.nilable(String),
            government_id: String,
            metadata: T::Hash[Symbol, String],
            preferences:
              HelloWorldTestingggg::ProfileCreateRequest::Preferences,
            secret_note: String
          }
        )
      end
      def to_hash
      end

      class Preferences < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::ProfileCreateRequest::Preferences,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T::Boolean])) }
        attr_reader :alerts

        sig { params(alerts: T::Hash[Symbol, T::Boolean]).void }
        attr_writer :alerts

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :newsletter

        sig { params(newsletter: T::Boolean).void }
        attr_writer :newsletter

        sig { returns(T.nilable(T.anything)) }
        attr_reader :score_by_region

        sig { params(score_by_region: T.anything).void }
        attr_writer :score_by_region

        sig do
          params(
            alerts: T::Hash[Symbol, T::Boolean],
            newsletter: T::Boolean,
            score_by_region: T.anything
          ).returns(T.attached_class)
        end
        def self.new(alerts: nil, newsletter: nil, score_by_region: nil)
        end

        sig do
          override.returns(
            {
              alerts: T::Hash[Symbol, T::Boolean],
              newsletter: T::Boolean,
              score_by_region: T.anything
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
