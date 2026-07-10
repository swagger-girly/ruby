# typed: strong

module HelloWorldTestingggg
  module Models
    class Profile < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Profile,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :display_name

      # Free-form audit metadata retained from integrations.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :audit_trail

      sig { params(audit_trail: T::Hash[Symbol, T.anything]).void }
      attr_writer :audit_trail

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Deprecated external profile code.
      sig { returns(T.nilable(String)) }
      attr_reader :legacy_code

      sig { params(legacy_code: String).void }
      attr_writer :legacy_code

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :phone_numbers

      sig { returns(T.nilable(HelloWorldTestingggg::Profile::Preferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: HelloWorldTestingggg::Profile::Preferences::OrHash
        ).void
      end
      attr_writer :preferences

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Time) }
      attr_accessor :updated_at

      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          id: String,
          created_at: Time,
          display_name: String,
          updated_at: Time,
          version: Integer,
          audit_trail: T::Hash[Symbol, T.anything],
          email: T.nilable(String),
          legacy_code: String,
          metadata: T::Hash[Symbol, String],
          phone_numbers: T.nilable(T::Array[String]),
          preferences: HelloWorldTestingggg::Profile::Preferences::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        display_name:,
        updated_at:,
        version:,
        # Free-form audit metadata retained from integrations.
        audit_trail: nil,
        email: nil,
        # Deprecated external profile code.
        legacy_code: nil,
        metadata: nil,
        phone_numbers: nil,
        preferences: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            display_name: String,
            updated_at: Time,
            version: Integer,
            audit_trail: T::Hash[Symbol, T.anything],
            email: T.nilable(String),
            legacy_code: String,
            metadata: T::Hash[Symbol, String],
            phone_numbers: T.nilable(T::Array[String]),
            preferences: HelloWorldTestingggg::Profile::Preferences
          }
        )
      end
      def to_hash
      end

      class Preferences < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Profile::Preferences,
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
