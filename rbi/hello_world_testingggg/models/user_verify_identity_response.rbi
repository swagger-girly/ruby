# typed: strong

module HelloWorldTestingggg
  module Models
    module UserVerifyIdentityResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification,
            HelloWorldTestingggg::Models::UserVerifyIdentityResponse::BasicVerification
          )
        end

      class KYBKYCVerification < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :token

        sig { params(token: String).void }
        attr_writer :token

        # Plural array: replicates lithic's re-cased Kybkyc element mint (control probe)
        sig do
          returns(
            T.nilable(
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual
              ]
            )
          )
        end
        attr_reader :beneficial_owner_individuals

        sig do
          params(
            beneficial_owner_individuals:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual::OrHash
              ]
          ).void
        end
        attr_writer :beneficial_owner_individuals

        # Plural array: second lithic-exact control probe
        sig do
          returns(
            T.nilable(
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason
              ]
            )
          )
        end
        attr_reader :status_reasons

        sig do
          params(
            status_reasons:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason::OrHash
              ]
          ).void
        end
        attr_writer :status_reasons

        # Nested object mirroring lithic's deeper plural mint
        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication
            )
          )
        end
        attr_reader :verification_application

        sig do
          params(
            verification_application:
              HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::OrHash
          ).void
        end
        attr_writer :verification_application

        # Non-plural array: the case lithic never exercises (decisive probe)
        sig do
          returns(
            T.nilable(
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument
              ]
            )
          )
        end
        attr_reader :verification_document

        sig do
          params(
            verification_document:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument::OrHash
              ]
          ).void
        end
        attr_writer :verification_document

        sig do
          params(
            token: String,
            beneficial_owner_individuals:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual::OrHash
              ],
            status_reasons:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason::OrHash
              ],
            verification_application:
              HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::OrHash,
            verification_document:
              T::Array[
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          token: nil,
          # Plural array: replicates lithic's re-cased Kybkyc element mint (control probe)
          beneficial_owner_individuals: nil,
          # Plural array: second lithic-exact control probe
          status_reasons: nil,
          # Nested object mirroring lithic's deeper plural mint
          verification_application: nil,
          # Non-plural array: the case lithic never exercises (decisive probe)
          verification_document: nil
        )
        end

        sig do
          override.returns(
            {
              token: String,
              beneficial_owner_individuals:
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual
                ],
              status_reasons:
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason
                ],
              verification_application:
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication,
              verification_document:
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument
                ]
            }
          )
        end
        def to_hash
        end

        class BeneficialOwnerIndividual < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :owner_name

          sig { params(owner_name: String).void }
          attr_writer :owner_name

          sig { params(owner_name: String).returns(T.attached_class) }
          def self.new(owner_name: nil)
          end

          sig { override.returns({ owner_name: String }) }
          def to_hash
          end
        end

        class StatusReason < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :reason_code

          sig { params(reason_code: String).void }
          attr_writer :reason_code

          sig { params(reason_code: String).returns(T.attached_class) }
          def self.new(reason_code: nil)
          end

          sig { override.returns({ reason_code: String }) }
          def to_hash
          end
        end

        class VerificationApplication < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason
                ]
              )
            )
          end
          attr_reader :status_reasons

          sig do
            params(
              status_reasons:
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason::OrHash
                ]
            ).void
          end
          attr_writer :status_reasons

          # Nested object mirroring lithic's deeper plural mint
          sig do
            params(
              status_reasons:
                T::Array[
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(status_reasons: nil)
          end

          sig do
            override.returns(
              {
                status_reasons:
                  T::Array[
                    HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason
                  ]
              }
            )
          end
          def to_hash
          end

          class StatusReason < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :application_note

            sig { params(application_note: String).void }
            attr_writer :application_note

            sig { params(application_note: String).returns(T.attached_class) }
            def self.new(application_note: nil)
            end

            sig { override.returns({ application_note: String }) }
            def to_hash
            end
          end
        end

        class VerificationDocument < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :document_id

          sig { params(document_id: String).void }
          attr_writer :document_id

          sig { params(document_id: String).returns(T.attached_class) }
          def self.new(document_id: nil)
          end

          sig { override.returns({ document_id: String }) }
          def to_hash
          end
        end
      end

      class BasicVerification < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::UserVerifyIdentityResponse::BasicVerification,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :token

        sig { params(token: String).void }
        attr_writer :token

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified

        sig { params(verified: T::Boolean).void }
        attr_writer :verified

        sig do
          params(token: String, verified: T::Boolean).returns(T.attached_class)
        end
        def self.new(token: nil, verified: nil)
        end

        sig { override.returns({ token: String, verified: T::Boolean }) }
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[
            HelloWorldTestingggg::Models::UserVerifyIdentityResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
