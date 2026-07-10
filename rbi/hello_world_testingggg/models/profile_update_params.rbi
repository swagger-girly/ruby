# typed: strong

module HelloWorldTestingggg
  module Models
    class ProfileUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::ProfileUpdateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :profile_id

      sig do
        returns(
          T.any(
            HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate,
            HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate
          )
        )
      end
      attr_accessor :body

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          profile_id: String,
          body:
            T.any(
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::OrHash,
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::OrHash
            ),
          idempotency_key: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        profile_id:,
        body:,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            profile_id: String,
            body:
              T.any(
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate,
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate
              ),
            idempotency_key: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Body
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate,
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate
            )
          end

        class ProfileDetailsUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :display_name

          sig { params(display_name: String).void }
          attr_writer :display_name

          sig { returns(T.nilable(String)) }
          attr_accessor :email

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :metadata

          sig { params(metadata: T::Hash[Symbol, String]).void }
          attr_writer :metadata

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences
              )
            )
          end
          attr_reader :preferences

          sig do
            params(
              preferences:
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences::OrHash
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              display_name: String,
              email: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              preferences:
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            display_name: nil,
            email: nil,
            metadata: nil,
            preferences: nil
          )
          end

          sig do
            override.returns(
              {
                display_name: String,
                email: T.nilable(String),
                metadata: T::Hash[Symbol, String],
                preferences:
                  HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences
              }
            )
          end
          def to_hash
          end

          class Preferences < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileDetailsUpdate::Preferences,
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

        class ProfileArchiveUpdate < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Time) }
          attr_accessor :archived_at

          sig do
            returns(
              HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::OrSymbol
            )
          end
          attr_accessor :archived_reason

          sig do
            params(
              archived_at: Time,
              archived_reason:
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(archived_at:, archived_reason:)
          end

          sig do
            override.returns(
              {
                archived_at: Time,
                archived_reason:
                  HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::OrSymbol
              }
            )
          end
          def to_hash
          end

          module ArchivedReason
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DUPLICATE =
              T.let(
                :duplicate,
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::TaggedSymbol
              )
            REQUESTED =
              T.let(
                :requested,
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::TaggedSymbol
              )
            POLICY_VIOLATION =
              T.let(
                :policy_violation,
                HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::ProfileUpdateParams::Body::ProfileArchiveUpdate::ArchivedReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::ProfileUpdateParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
