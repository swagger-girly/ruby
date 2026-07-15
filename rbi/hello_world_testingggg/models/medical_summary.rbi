# typed: strong

module HelloWorldTestingggg
  module Models
    class MedicalSummary < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::MedicalSummary,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :pet_id

      # Provenance stamp attached to records across unrelated resources.
      sig { returns(T.nilable(HelloWorldTestingggg::MedicalSummary::Audit)) }
      attr_reader :audit

      sig do
        params(audit: HelloWorldTestingggg::MedicalSummary::Audit::OrHash).void
      end
      attr_writer :audit

      sig do
        returns(
          T.nilable(T::Array[HelloWorldTestingggg::MedicalSummary::Condition])
        )
      end
      attr_reader :conditions

      sig do
        params(
          conditions:
            T::Array[HelloWorldTestingggg::MedicalSummary::Condition::OrHash]
        ).void
      end
      attr_writer :conditions

      sig do
        returns(T.nilable(T::Array[HelloWorldTestingggg::VaccinationRecord]))
      end
      attr_reader :vaccinations

      sig do
        params(
          vaccinations:
            T::Array[HelloWorldTestingggg::VaccinationRecord::OrHash]
        ).void
      end
      attr_writer :vaccinations

      sig do
        params(
          pet_id: Integer,
          audit: HelloWorldTestingggg::MedicalSummary::Audit::OrHash,
          conditions:
            T::Array[HelloWorldTestingggg::MedicalSummary::Condition::OrHash],
          vaccinations:
            T::Array[HelloWorldTestingggg::VaccinationRecord::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        pet_id:,
        # Provenance stamp attached to records across unrelated resources.
        audit: nil,
        conditions: nil,
        vaccinations: nil
      )
      end

      sig do
        override.returns(
          {
            pet_id: Integer,
            audit: HelloWorldTestingggg::MedicalSummary::Audit,
            conditions:
              T::Array[HelloWorldTestingggg::MedicalSummary::Condition],
            vaccinations: T::Array[HelloWorldTestingggg::VaccinationRecord]
          }
        )
      end
      def to_hash
      end

      class Audit < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::MedicalSummary::Audit,
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
              HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
            )
          )
        end
        attr_reader :source

        sig do
          params(
            source:
              HelloWorldTestingggg::MedicalSummary::Audit::Source::OrSymbol
          ).void
        end
        attr_writer :source

        # Provenance stamp attached to records across unrelated resources.
        sig do
          params(
            recorded_at: Time,
            recorded_by: String,
            source:
              HelloWorldTestingggg::MedicalSummary::Audit::Source::OrSymbol
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
                HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Source
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, HelloWorldTestingggg::MedicalSummary::Audit::Source)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MANUAL =
            T.let(
              :manual,
              HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
            )
          IMPORT =
            T.let(
              :import,
              HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
            )
          SYSTEM =
            T.let(
              :system,
              HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::MedicalSummary::Audit::Source::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Condition < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::MedicalSummary::Condition,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :code

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol
            )
          )
        end
        attr_reader :severity

        sig do
          params(
            severity:
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::OrSymbol
          ).void
        end
        attr_writer :severity

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::MedicalSummary::Condition::Treatment
            )
          )
        end
        attr_reader :treatment

        sig do
          params(
            treatment:
              HelloWorldTestingggg::MedicalSummary::Condition::Treatment::OrHash
          ).void
        end
        attr_writer :treatment

        sig do
          params(
            code: String,
            severity:
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::OrSymbol,
            treatment:
              HelloWorldTestingggg::MedicalSummary::Condition::Treatment::OrHash
          ).returns(T.attached_class)
        end
        def self.new(code:, severity: nil, treatment: nil)
        end

        sig do
          override.returns(
            {
              code: String,
              severity:
                HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol,
              treatment:
                HelloWorldTestingggg::MedicalSummary::Condition::Treatment
            }
          )
        end
        def to_hash
        end

        module Severity
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::MedicalSummary::Condition::Severity
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MILD =
            T.let(
              :mild,
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol
            )
          MODERATE =
            T.let(
              :moderate,
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol
            )
          SEVERE =
            T.let(
              :severe,
              HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::MedicalSummary::Condition::Severity::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Treatment < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::MedicalSummary::Condition::Treatment,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication
                ]
              )
            )
          end
          attr_reader :medications

          sig do
            params(
              medications:
                T::Array[
                  HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::OrHash
                ]
            ).void
          end
          attr_writer :medications

          sig { returns(T.nilable(String)) }
          attr_reader :plan

          sig { params(plan: String).void }
          attr_writer :plan

          sig do
            params(
              medications:
                T::Array[
                  HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::OrHash
                ],
              plan: String
            ).returns(T.attached_class)
          end
          def self.new(medications: nil, plan: nil)
          end

          sig do
            override.returns(
              {
                medications:
                  T::Array[
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication
                  ],
                plan: String
              }
            )
          end
          def to_hash
          end

          class Medication < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            # Free-form dosage text or a structured dosage.
            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::Variants
                )
              )
            end
            attr_reader :dosage

            sig do
              params(
                dosage:
                  T.any(
                    String,
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage::OrHash
                  )
              ).void
            end
            attr_writer :dosage

            sig do
              params(
                name: String,
                dosage:
                  T.any(
                    String,
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              name:,
              # Free-form dosage text or a structured dosage.
              dosage: nil
            )
            end

            sig do
              override.returns(
                {
                  name: String,
                  dosage:
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::Variants
                }
              )
            end
            def to_hash
            end

            # Free-form dosage text or a structured dosage.
            module Dosage
              extend HelloWorldTestingggg::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    String,
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage
                  )
                end

              class StructuredDosage < HelloWorldTestingggg::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::StructuredDosage,
                      HelloWorldTestingggg::Internal::AnyHash
                    )
                  end

                sig { returns(Float) }
                attr_accessor :amount

                sig { returns(String) }
                attr_accessor :unit

                sig { returns(T.nilable(String)) }
                attr_reader :frequency

                sig { params(frequency: String).void }
                attr_writer :frequency

                sig do
                  params(
                    amount: Float,
                    unit: String,
                    frequency: String
                  ).returns(T.attached_class)
                end
                def self.new(amount:, unit:, frequency: nil)
                end

                sig do
                  override.returns(
                    { amount: Float, unit: String, frequency: String }
                  )
                end
                def to_hash
                end
              end

              sig do
                override.returns(
                  T::Array[
                    HelloWorldTestingggg::MedicalSummary::Condition::Treatment::Medication::Dosage::Variants
                  ]
                )
              end
              def self.variants
              end
            end
          end
        end
      end
    end
  end
end
