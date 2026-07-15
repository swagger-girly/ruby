# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class VaccinationRecord < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute administered_at
      #
      #   @return [Time]
      required :administered_at, Time, api_name: :administeredAt

      # @!attribute vaccine
      #
      #   @return [String]
      required :vaccine, String

      # @!attribute audit
      #   Provenance stamp attached to records across unrelated resources.
      #
      #   @return [HelloWorldTestingggg::Models::VaccinationRecord::Audit, nil]
      optional :audit, -> { HelloWorldTestingggg::VaccinationRecord::Audit }

      # @!attribute booster_schedule
      #
      #   @return [Array<HelloWorldTestingggg::Models::VaccinationRecord::BoosterSchedule>, nil]
      optional :booster_schedule,
               -> {
                 HelloWorldTestingggg::Internal::Type::ArrayOf[HelloWorldTestingggg::VaccinationRecord::BoosterSchedule]
               },
               api_name: :boosterSchedule

      # @!attribute veterinarian
      #
      #   @return [HelloWorldTestingggg::Models::VaccinationRecord::Veterinarian, nil]
      optional :veterinarian, -> { HelloWorldTestingggg::VaccinationRecord::Veterinarian }

      # @!method initialize(id:, administered_at:, vaccine:, audit: nil, booster_schedule: nil, veterinarian: nil)
      #   @param id [String]
      #
      #   @param administered_at [Time]
      #
      #   @param vaccine [String]
      #
      #   @param audit [HelloWorldTestingggg::Models::VaccinationRecord::Audit] Provenance stamp attached to records across unrelated resources.
      #
      #   @param booster_schedule [Array<HelloWorldTestingggg::Models::VaccinationRecord::BoosterSchedule>]
      #
      #   @param veterinarian [HelloWorldTestingggg::Models::VaccinationRecord::Veterinarian]

      # @see HelloWorldTestingggg::Models::VaccinationRecord#audit
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
        #   @return [Symbol, HelloWorldTestingggg::Models::VaccinationRecord::Audit::Source, nil]
        optional :source, enum: -> { HelloWorldTestingggg::VaccinationRecord::Audit::Source }

        # @!method initialize(recorded_at:, recorded_by: nil, source: nil)
        #   Provenance stamp attached to records across unrelated resources.
        #
        #   @param recorded_at [Time]
        #   @param recorded_by [String]
        #   @param source [Symbol, HelloWorldTestingggg::Models::VaccinationRecord::Audit::Source]

        # @see HelloWorldTestingggg::Models::VaccinationRecord::Audit#source
        module Source
          extend HelloWorldTestingggg::Internal::Type::Enum

          MANUAL = :manual
          IMPORT = :import
          SYSTEM = :system

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class BoosterSchedule < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute due
        #
        #   @return [Time]
        required :due, Time

        # @!attribute completed
        #
        #   @return [Boolean, nil]
        optional :completed, HelloWorldTestingggg::Internal::Type::Boolean

        # @!attribute dose
        #
        #   @return [Float, String, nil]
        optional :dose, union: -> { HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose }

        # @!method initialize(due:, completed: nil, dose: nil)
        #   @param due [Time]
        #   @param completed [Boolean]
        #   @param dose [Float, String]

        # @see HelloWorldTestingggg::Models::VaccinationRecord::BoosterSchedule#dose
        module Dose
          extend HelloWorldTestingggg::Internal::Type::Union

          variant Float

          variant String

          # @!method self.variants
          #   @return [Array(Float, String)]
        end
      end

      # @see HelloWorldTestingggg::Models::VaccinationRecord#veterinarian
      class Veterinarian < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute license
        #
        #   @return [HelloWorldTestingggg::Models::VaccinationRecord::Veterinarian::License, nil]
        optional :license, -> { HelloWorldTestingggg::VaccinationRecord::Veterinarian::License }

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(license: nil, name: nil)
        #   @param license [HelloWorldTestingggg::Models::VaccinationRecord::Veterinarian::License]
        #   @param name [String]

        # @see HelloWorldTestingggg::Models::VaccinationRecord::Veterinarian#license
        class License < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute number
          #
          #   @return [String, nil]
          optional :number, String

          # @!attribute region
          #
          #   @return [String, nil]
          optional :region, String

          # @!method initialize(number: nil, region: nil)
          #   @param number [String]
          #   @param region [String]
        end
      end
    end
  end
end
