# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::User#verify_identity
    module UserVerifyIdentityResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      variant -> { HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification }

      variant -> { HelloWorldTestingggg::Models::UserVerifyIdentityResponse::BasicVerification }

      class KYBKYCVerification < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute token
        #
        #   @return [String, nil]
        optional :token, String

        # @!attribute beneficial_owner_individuals
        #   Plural array: replicates lithic's re-cased Kybkyc element mint (control probe)
        #
        #   @return [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual>, nil]
        optional :beneficial_owner_individuals,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual] }

        # @!attribute status_reasons
        #   Plural array: second lithic-exact control probe
        #
        #   @return [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason>, nil]
        optional :status_reasons,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason] }

        # @!attribute verification_application
        #   Nested object mirroring lithic's deeper plural mint
        #
        #   @return [HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication, nil]
        optional :verification_application,
                 -> { HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication }

        # @!attribute verification_document
        #   Non-plural array: the case lithic never exercises (decisive probe)
        #
        #   @return [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument>, nil]
        optional :verification_document,
                 -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument] }

        # @!method initialize(token: nil, beneficial_owner_individuals: nil, status_reasons: nil, verification_application: nil, verification_document: nil)
        #   @param token [String]
        #
        #   @param beneficial_owner_individuals [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::BeneficialOwnerIndividual>] Plural array: replicates lithic's re-cased Kybkyc element mint (control probe)
        #
        #   @param status_reasons [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::StatusReason>] Plural array: second lithic-exact control probe
        #
        #   @param verification_application [HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication] Nested object mirroring lithic's deeper plural mint
        #
        #   @param verification_document [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationDocument>] Non-plural array: the case lithic never exercises (decisive probe)

        class BeneficialOwnerIndividual < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute owner_name
          #
          #   @return [String, nil]
          optional :owner_name, String

          # @!method initialize(owner_name: nil)
          #   @param owner_name [String]
        end

        class StatusReason < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute reason_code
          #
          #   @return [String, nil]
          optional :reason_code, String

          # @!method initialize(reason_code: nil)
          #   @param reason_code [String]
        end

        # @see HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification#verification_application
        class VerificationApplication < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute status_reasons
          #
          #   @return [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason>, nil]
          optional :status_reasons,
                   -> do
                     HelloWorldTestingggg::Internal::Type::ArrayOf[
                       HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason
                     ]
                   end

          # @!method initialize(status_reasons: nil)
          #   Nested object mirroring lithic's deeper plural mint
          #
          #   @param status_reasons [Array<HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification::VerificationApplication::StatusReason>]

          class StatusReason < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute application_note
            #
            #   @return [String, nil]
            optional :application_note, String

            # @!method initialize(application_note: nil)
            #   @param application_note [String]
          end
        end

        class VerificationDocument < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute document_id
          #
          #   @return [String, nil]
          optional :document_id, String

          # @!method initialize(document_id: nil)
          #   @param document_id [String]
        end
      end

      class BasicVerification < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute token
        #
        #   @return [String, nil]
        optional :token, String

        # @!attribute verified
        #
        #   @return [Boolean, nil]
        optional :verified, HelloWorldTestingggg::Internal::Type::Boolean

        # @!method initialize(token: nil, verified: nil)
        #   @param token [String]
        #   @param verified [Boolean]
      end

      # @!method self.variants
      #   @return [Array(HelloWorldTestingggg::Models::UserVerifyIdentityResponse::KYBKYCVerification, HelloWorldTestingggg::Models::UserVerifyIdentityResponse::BasicVerification)]
    end
  end
end
