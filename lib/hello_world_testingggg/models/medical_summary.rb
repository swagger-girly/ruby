# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class MedicalSummary < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute pet_id
      #
      #   @return [Integer]
      required :pet_id, Integer, api_name: :petId

      # @!attribute audit
      #   Provenance stamp attached to records across unrelated resources.
      #
      #   @return [HelloWorldTestingggg::Models::MedicalSummary::Audit, nil]
      optional :audit, -> { HelloWorldTestingggg::MedicalSummary::Audit }

      # @!attribute conditions
      #
      #   @return [Array<HelloWorldTestingggg::Models::MedicalSummary::Condition>, nil]
      optional :conditions,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::MedicalSummary::Condition] }

      # @!attribute vaccinations
      #
      #   @return [Array<HelloWorldTestingggg::Models::VaccinationRecord>, nil]
      optional :vaccinations,
               -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::VaccinationRecord] }

      # @!method initialize(pet_id:, audit: nil, conditions: nil, vaccinations: nil)
      #   @param pet_id [Integer]
      #
      #   @param audit [HelloWorldTestingggg::Models::MedicalSummary::Audit] Provenance stamp attached to records across unrelated resources.
      #
      #   @param conditions [Array<HelloWorldTestingggg::Models::MedicalSummary::Condition>]
      #
      #   @param vaccinations [Array<HelloWorldTestingggg::Models::VaccinationRecord>]

      # @see HelloWorldTestingggg::Models::MedicalSummary#audit
      class Audit < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute recorded_at
        #
        #   @return [Time]
        required :recorded_at, Time, api_name: :recordedAt

        # @!attribute recorded_by
        #
        #   @return [String, nil]
        optional :recorded_by, String, api_name: :recordedBy

        # @!attribute source
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::MedicalSummary::Audit::Source, nil]
        optional :source, enum: -> { HelloWorldTestingggg::MedicalSummary::Audit::Source }

        # @!method initialize(recorded_at:, recorded_by: nil, source: nil)
        #   Provenance stamp attached to records across unrelated resources.
        #
        #   @param recorded_at [Time]
        #   @param recorded_by [String]
        #   @param source [Symbol, HelloWorldTestingggg::Models::MedicalSummary::Audit::Source]

        # @see HelloWorldTestingggg::Models::MedicalSummary::Audit#source
        module Source
          extend HelloWorldTestingggg::Internal::Type::Enum

          MANUAL = :manual
          IMPORT = :import
          SYSTEM = :system

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Condition < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute code
        #
        #   @return [String]
        required :code, String

        # @!attribute severity
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::MedicalSummary::Condition::Severity, nil]
        optional :severity, enum: -> { HelloWorldTestingggg::MedicalSummary::Condition::Severity }

        # @!attribute treatment
        #
        #   @return [HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment, nil]
        optional :treatment, -> { HelloWorldTestingggg::MedicalSummary::Condition::Treatment }

        # @!method initialize(code:, severity: nil, treatment: nil)
        #   @param code [String]
        #   @param severity [Symbol, HelloWorldTestingggg::Models::MedicalSummary::Condition::Severity]
        #   @param treatment [HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment]

        # @see HelloWorldTestingggg::Models::MedicalSummary::Condition#severity
        module Severity
          extend HelloWorldTestingggg::Internal::Type::Enum

          MILD = :mild
          MODERATE = :moderate
          SEVERE = :severe

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see HelloWorldTestingggg::Models::MedicalSummary::Condition#treatment
        class Treatment < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute medications
          #
          #   @return [Array<HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication>, nil]
          optional :medications,
                   -> { HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication] }

          # @!attribute plan
          #
          #   @return [String, nil]
          optional :plan, String

          # @!method initialize(medications: nil, plan: nil)
          #   @param medications [Array<HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication>]
          #   @param plan [String]

          class Medication < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute dosage
            #   Free-form dosage text or a structured dosage.
            #
            #   @return [String, HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage, nil]
            optional :dosage,
                     union: -> { HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage }

            # @!method initialize(name:, dosage: nil)
            #   @param name [String]
            #
            #   @param dosage [String, HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage] Free-form dosage text or a structured dosage.

            # Free-form dosage text or a structured dosage.
            #
            # @see HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication#dosage
            module Dosage
              extend HelloWorldTestingggg::Internal::Type::Union

              variant String

              variant -> { HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage }

              class StructuredDosage < HelloWorldTestingggg::Internal::Type::BaseModel
                # @!attribute amount
                #
                #   @return [Float]
                required :amount, Float

                # @!attribute unit
                #
                #   @return [String]
                required :unit, String

                # @!attribute frequency
                #
                #   @return [String, nil]
                optional :frequency, String

                # @!method initialize(amount:, unit:, frequency: nil)
                #   @param amount [Float]
                #   @param unit [String]
                #   @param frequency [String]
              end

              # @!method self.variants
              #   @return [Array(String, HelloWorldTestingggg::Models::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage)]
            end
          end
        end
      end
    end
  end
end
