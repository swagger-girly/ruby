# typed: strong

module HelloWorldTestingggg
  module Models
    class VaccinationRecord < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::VaccinationRecord,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :administered_at

      sig { returns(String) }
      attr_accessor :vaccine

      # Provenance stamp attached to records across unrelated resources.
      sig { returns(T.nilable(HelloWorldTestingggg::VaccinationRecord::Audit)) }
      attr_reader :audit

      sig do
        params(
          audit: HelloWorldTestingggg::VaccinationRecord::Audit::OrHash
        ).void
      end
      attr_writer :audit

      sig do
        returns(
          T.nilable(
            T::Array[HelloWorldTestingggg::VaccinationRecord::BoosterSchedule]
          )
        )
      end
      attr_reader :booster_schedule

      sig do
        params(
          booster_schedule:
            T::Array[
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::OrHash
            ]
        ).void
      end
      attr_writer :booster_schedule

      sig do
        returns(
          T.nilable(HelloWorldTestingggg::VaccinationRecord::Veterinarian)
        )
      end
      attr_reader :veterinarian

      sig do
        params(
          veterinarian:
            HelloWorldTestingggg::VaccinationRecord::Veterinarian::OrHash
        ).void
      end
      attr_writer :veterinarian

      sig do
        params(
          id: String,
          administered_at: Time,
          vaccine: String,
          audit: HelloWorldTestingggg::VaccinationRecord::Audit::OrHash,
          booster_schedule:
            T::Array[
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::OrHash
            ],
          veterinarian:
            HelloWorldTestingggg::VaccinationRecord::Veterinarian::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        administered_at:,
        vaccine:,
        # Provenance stamp attached to records across unrelated resources.
        audit: nil,
        booster_schedule: nil,
        veterinarian: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            administered_at: Time,
            vaccine: String,
            audit: HelloWorldTestingggg::VaccinationRecord::Audit,
            booster_schedule:
              T::Array[
                HelloWorldTestingggg::VaccinationRecord::BoosterSchedule
              ],
            veterinarian: HelloWorldTestingggg::VaccinationRecord::Veterinarian
          }
        )
      end
      def to_hash
      end

      class Audit < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::VaccinationRecord::Audit,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :recorded_at

        sig { returns(T.nilable(String)) }
        attr_reader :recorded_by

        sig { params(recorded_by: String).void }
        attr_writer :recorded_by

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::OrSymbol
            )
          )
        end
        attr_reader :source

        sig do
          params(
            source:
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::OrSymbol
          ).void
        end
        attr_writer :source

        # Provenance stamp attached to records across unrelated resources.
        sig do
          params(
            recorded_at: Time,
            recorded_by: String,
            source:
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(recorded_at:, recorded_by: nil, source: nil)
        end

        sig do
          override.returns(
            {
              recorded_at: Time,
              recorded_by: String,
              source:
                HelloWorldTestingggg::VaccinationRecord::Audit::Source::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Source
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::VaccinationRecord::Audit::Source
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MANUAL =
            T.let(
              :manual,
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::TaggedSymbol
            )
          IMPORT =
            T.let(
              :import,
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::TaggedSymbol
            )
          SYSTEM =
            T.let(
              :system,
              HelloWorldTestingggg::VaccinationRecord::Audit::Source::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::VaccinationRecord::Audit::Source::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class BoosterSchedule < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :due

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :completed

        sig { params(completed: T::Boolean).void }
        attr_writer :completed

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose::Variants
            )
          )
        end
        attr_reader :dose

        sig do
          params(
            dose:
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose::Variants
          ).void
        end
        attr_writer :dose

        sig do
          params(
            due: Time,
            completed: T::Boolean,
            dose:
              HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose::Variants
          ).returns(T.attached_class)
        end
        def self.new(due:, completed: nil, dose: nil)
        end

        sig do
          override.returns(
            {
              due: Time,
              completed: T::Boolean,
              dose:
                HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose::Variants
            }
          )
        end
        def to_hash
        end

        module Dose
          extend HelloWorldTestingggg::Internal::Type::Union

          Variants = T.type_alias { T.any(Float, String) }

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::VaccinationRecord::BoosterSchedule::Dose::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end

      class Veterinarian < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::VaccinationRecord::Veterinarian,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::VaccinationRecord::Veterinarian::License
            )
          )
        end
        attr_reader :license

        sig do
          params(
            license:
              HelloWorldTestingggg::VaccinationRecord::Veterinarian::License::OrHash
          ).void
        end
        attr_writer :license

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig do
          params(
            license:
              HelloWorldTestingggg::VaccinationRecord::Veterinarian::License::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(license: nil, name: nil)
        end

        sig do
          override.returns(
            {
              license:
                HelloWorldTestingggg::VaccinationRecord::Veterinarian::License,
              name: String
            }
          )
        end
        def to_hash
        end

        class License < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::VaccinationRecord::Veterinarian::License,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :number

          sig { params(number: String).void }
          attr_writer :number

          sig { returns(T.nilable(String)) }
          attr_reader :region

          sig { params(region: String).void }
          attr_writer :region

          sig do
            params(number: String, region: String).returns(T.attached_class)
          end
          def self.new(number: nil, region: nil)
          end

          sig { override.returns({ number: String, region: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
