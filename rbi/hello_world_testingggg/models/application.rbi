# typed: strong

module HelloWorldTestingggg
  module Models
    class Application < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Application,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(HelloWorldTestingggg::Application::Applicant::Variants) }
      attr_accessor :applicant

      sig { returns(HelloWorldTestingggg::Application::Status::TaggedSymbol) }
      attr_accessor :status

      # The decision for an application; the shape depends on the outcome.
      sig do
        returns(
          T.nilable(HelloWorldTestingggg::Application::Decision::Variants)
        )
      end
      attr_reader :decision

      sig do
        params(
          decision:
            T.any(
              HelloWorldTestingggg::Application::Decision::DecisionApproved::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionRejected::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionEscalated::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::OrHash
            )
        ).void
      end
      attr_writer :decision

      sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
      attr_reader :fee

      sig { params(fee: HelloWorldTestingggg::Money::OrHash).void }
      attr_writer :fee

      sig do
        returns(T.nilable(T::Array[HelloWorldTestingggg::Application::History]))
      end
      attr_reader :history

      sig do
        params(
          history: T::Array[HelloWorldTestingggg::Application::History::OrHash]
        ).void
      end
      attr_writer :history

      sig do
        returns(T.nilable(HelloWorldTestingggg::Application::LatestRejection))
      end
      attr_reader :latest_rejection

      sig do
        params(
          latest_rejection:
            HelloWorldTestingggg::Application::LatestRejection::OrHash
        ).void
      end
      attr_writer :latest_rejection

      sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
      attr_reader :pet

      sig { params(pet: HelloWorldTestingggg::PetAPI::OrHash).void }
      attr_writer :pet

      sig { returns(Time) }
      attr_accessor :submitted_at

      sig do
        params(
          id: String,
          applicant:
            T.any(
              HelloWorldTestingggg::Application::Applicant::Individual::OrHash,
              HelloWorldTestingggg::Application::Applicant::Organization::OrHash
            ),
          status: HelloWorldTestingggg::Application::Status::OrSymbol,
          submitted_at: Time,
          decision:
            T.any(
              HelloWorldTestingggg::Application::Decision::DecisionApproved::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionRejected::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionEscalated::OrHash,
              HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::OrHash
            ),
          fee: HelloWorldTestingggg::Money::OrHash,
          history: T::Array[HelloWorldTestingggg::Application::History::OrHash],
          latest_rejection:
            HelloWorldTestingggg::Application::LatestRejection::OrHash,
          pet: HelloWorldTestingggg::PetAPI::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        applicant:,
        status:,
        submitted_at:,
        # The decision for an application; the shape depends on the outcome.
        decision: nil,
        fee: nil,
        history: nil,
        latest_rejection: nil,
        pet: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            applicant: HelloWorldTestingggg::Application::Applicant::Variants,
            status: HelloWorldTestingggg::Application::Status::TaggedSymbol,
            submitted_at: Time,
            decision: HelloWorldTestingggg::Application::Decision::Variants,
            fee: HelloWorldTestingggg::Money,
            history: T::Array[HelloWorldTestingggg::Application::History],
            latest_rejection:
              HelloWorldTestingggg::Application::LatestRejection,
            pet: HelloWorldTestingggg::PetAPI
          }
        )
      end
      def to_hash
      end

      module Applicant
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Application::Applicant::Individual,
              HelloWorldTestingggg::Application::Applicant::Organization
            )
          end

        class Individual < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Applicant::Individual,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :applicant_type

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
          attr_reader :address

          sig { params(address: HelloWorldTestingggg::Address::OrHash).void }
          attr_writer :address

          sig { returns(T.nilable(Integer)) }
          attr_reader :age

          sig { params(age: Integer).void }
          attr_writer :age

          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          sig do
            params(
              name: String,
              address: HelloWorldTestingggg::Address::OrHash,
              age: Integer,
              email: String,
              applicant_type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            address: nil,
            age: nil,
            email: nil,
            applicant_type: :individual
          )
          end

          sig do
            override.returns(
              {
                applicant_type: Symbol,
                name: String,
                address: HelloWorldTestingggg::Address,
                age: Integer,
                email: String
              }
            )
          end
          def to_hash
          end
        end

        class Organization < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Applicant::Organization,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :applicant_type

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::Application::Applicant::Organization::Shelter
              )
            )
          end
          attr_reader :shelter

          sig do
            params(
              shelter:
                HelloWorldTestingggg::Application::Applicant::Organization::Shelter::OrHash
            ).void
          end
          attr_writer :shelter

          sig { returns(T.nilable(String)) }
          attr_reader :tax_id

          sig { params(tax_id: String).void }
          attr_writer :tax_id

          sig do
            params(
              name: String,
              shelter:
                HelloWorldTestingggg::Application::Applicant::Organization::Shelter::OrHash,
              tax_id: String,
              applicant_type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            shelter: nil,
            tax_id: nil,
            applicant_type: :organization
          )
          end

          sig do
            override.returns(
              {
                applicant_type: Symbol,
                name: String,
                shelter:
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter,
                tax_id: String
              }
            )
          end
          def to_hash
          end

          class Shelter < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
            attr_reader :address

            sig { params(address: HelloWorldTestingggg::Address::OrHash).void }
            attr_writer :address

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact
                )
              )
            end
            attr_reader :contact

            sig do
              params(
                contact:
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::OrHash
              ).void
            end
            attr_writer :contact

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location
                )
              )
            end
            attr_reader :location

            sig do
              params(
                location:
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location::OrHash
              ).void
            end
            attr_writer :location

            sig do
              params(
                name: String,
                address: HelloWorldTestingggg::Address::OrHash,
                contact:
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::OrHash,
                location:
                  HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location::OrHash
              ).returns(T.attached_class)
            end
            def self.new(name:, address: nil, contact: nil, location: nil)
            end

            sig do
              override.returns(
                {
                  name: String,
                  address: HelloWorldTestingggg::Address,
                  contact:
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact,
                  location:
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location
                }
              )
            end
            def to_hash
            end

            class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary
                  )
                )
              end
              attr_reader :primary

              sig do
                params(
                  primary:
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::OrHash
                ).void
              end
              attr_writer :primary

              sig do
                params(
                  primary:
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::OrHash
                ).returns(T.attached_class)
              end
              def self.new(primary: nil)
              end

              sig do
                override.returns(
                  {
                    primary:
                      HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary
                  }
                )
              end
              def to_hash
              end

              class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary,
                      HelloWorldTestingggg::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    T.nilable(
                      HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability
                    )
                  )
                end
                attr_reader :availability

                sig do
                  params(
                    availability:
                      HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::OrHash
                  ).void
                end
                attr_writer :availability

                sig { returns(T.nilable(String)) }
                attr_reader :name

                sig { params(name: String).void }
                attr_writer :name

                sig { returns(T.nilable(String)) }
                attr_reader :phone

                sig { params(phone: String).void }
                attr_writer :phone

                sig do
                  params(
                    availability:
                      HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::OrHash,
                    name: String,
                    phone: String
                  ).returns(T.attached_class)
                end
                def self.new(availability: nil, name: nil, phone: nil)
                end

                sig do
                  override.returns(
                    {
                      availability:
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability,
                      name: String,
                      phone: String
                    }
                  )
                end
                def to_hash
                end

                class Availability < HelloWorldTestingggg::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability,
                        HelloWorldTestingggg::Internal::AnyHash
                      )
                    end

                  sig do
                    returns(
                      T.nilable(
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday
                      )
                    )
                  end
                  attr_reader :weekday

                  sig do
                    params(
                      weekday:
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday::OrHash
                    ).void
                  end
                  attr_writer :weekday

                  sig do
                    returns(
                      T.nilable(
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend
                      )
                    )
                  end
                  attr_reader :weekend

                  sig do
                    params(
                      weekend:
                        T.nilable(
                          HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend::OrHash
                        )
                    ).void
                  end
                  attr_writer :weekend

                  sig do
                    params(
                      weekday:
                        HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday::OrHash,
                      weekend:
                        T.nilable(
                          HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend::OrHash
                        )
                    ).returns(T.attached_class)
                  end
                  def self.new(weekday: nil, weekend: nil)
                  end

                  sig do
                    override.returns(
                      {
                        weekday:
                          HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday,
                        weekend:
                          T.nilable(
                            HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend
                          )
                      }
                    )
                  end
                  def to_hash
                  end

                  class Weekday < HelloWorldTestingggg::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekday,
                          HelloWorldTestingggg::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(String)) }
                    attr_reader :close

                    sig { params(close: String).void }
                    attr_writer :close

                    sig { returns(T.nilable(String)) }
                    attr_reader :open_

                    sig { params(open_: String).void }
                    attr_writer :open_

                    sig do
                      params(close: String, open_: String).returns(
                        T.attached_class
                      )
                    end
                    def self.new(close: nil, open_: nil)
                    end

                    sig { override.returns({ close: String, open_: String }) }
                    def to_hash
                    end
                  end

                  class Weekend < HelloWorldTestingggg::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Contact::Primary::Availability::Weekend,
                          HelloWorldTestingggg::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(String)) }
                    attr_reader :close

                    sig { params(close: String).void }
                    attr_writer :close

                    sig { returns(T.nilable(String)) }
                    attr_reader :open_

                    sig { params(open_: String).void }
                    attr_writer :open_

                    sig do
                      params(close: String, open_: String).returns(
                        T.attached_class
                      )
                    end
                    def self.new(close: nil, open_: nil)
                    end

                    sig { override.returns({ close: String, open_: String }) }
                    def to_hash
                    end
                  end
                end
              end
            end

            class Location < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Application::Applicant::Organization::Shelter::Location,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig { returns(Float) }
              attr_accessor :latitude

              sig { returns(Float) }
              attr_accessor :longitude

              sig do
                params(latitude: Float, longitude: Float).returns(
                  T.attached_class
                )
              end
              def self.new(latitude:, longitude:)
              end

              sig { override.returns({ latitude: Float, longitude: Float }) }
              def to_hash
              end
            end
          end
        end

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Application::Applicant::Variants]
          )
        end
        def self.variants
        end
      end

      module Status
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, HelloWorldTestingggg::Application::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RECEIVED =
          T.let(
            :received,
            HelloWorldTestingggg::Application::Status::TaggedSymbol
          )
        UNDER_REVIEW =
          T.let(
            :under_review,
            HelloWorldTestingggg::Application::Status::TaggedSymbol
          )
        APPROVED =
          T.let(
            :approved,
            HelloWorldTestingggg::Application::Status::TaggedSymbol
          )
        REJECTED =
          T.let(
            :rejected,
            HelloWorldTestingggg::Application::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Application::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The decision for an application; the shape depends on the outcome.
      module Decision
        extend HelloWorldTestingggg::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Application::Decision::DecisionApproved,
              HelloWorldTestingggg::Application::Decision::DecisionRejected,
              HelloWorldTestingggg::Application::Decision::DecisionEscalated,
              HelloWorldTestingggg::Application::Decision::DecisionWithdrawn
            )
          end

        class DecisionApproved < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Decision::DecisionApproved,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Time) }
          attr_accessor :approved_at

          sig { returns(Symbol) }
          attr_accessor :outcome

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :conditions

          sig { params(conditions: T::Array[String]).void }
          attr_writer :conditions

          sig do
            params(
              approved_at: Time,
              conditions: T::Array[String],
              outcome: Symbol
            ).returns(T.attached_class)
          end
          def self.new(approved_at:, conditions: nil, outcome: :approved)
          end

          sig do
            override.returns(
              {
                approved_at: Time,
                outcome: Symbol,
                conditions: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end

        class DecisionRejected < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Decision::DecisionRejected,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :outcome

          sig do
            returns(
              HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          sig { returns(T.nilable(Time)) }
          attr_accessor :appeal_deadline

          sig do
            params(
              reason:
                HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::OrSymbol,
              appeal_deadline: T.nilable(Time),
              outcome: Symbol
            ).returns(T.attached_class)
          end
          def self.new(reason:, appeal_deadline: nil, outcome: :rejected)
          end

          sig do
            override.returns(
              {
                outcome: Symbol,
                reason:
                  HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol,
                appeal_deadline: T.nilable(Time)
              }
            )
          end
          def to_hash
          end

          module Reason
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            POLICY =
              T.let(
                :policy,
                HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol
              )
            CAPACITY =
              T.let(
                :capacity,
                HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol
              )
            INCOMPLETE =
              T.let(
                :incomplete,
                HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Application::Decision::DecisionRejected::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class DecisionEscalated < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Decision::DecisionEscalated,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo
            )
          end
          attr_reader :escalated_to

          sig do
            params(
              escalated_to:
                HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::OrHash
            ).void
          end
          attr_writer :escalated_to

          sig { returns(Symbol) }
          attr_accessor :outcome

          sig { returns(T.nilable(Time)) }
          attr_reader :review_after

          sig { params(review_after: Time).void }
          attr_writer :review_after

          sig do
            params(
              escalated_to:
                HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::OrHash,
              review_after: Time,
              outcome: Symbol
            ).returns(T.attached_class)
          end
          def self.new(escalated_to:, review_after: nil, outcome: :escalated)
          end

          sig do
            override.returns(
              {
                escalated_to:
                  HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo,
                outcome: Symbol,
                review_after: Time
              }
            )
          end
          def to_hash
          end

          class EscalatedTo < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :team

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact
                )
              )
            end
            attr_reader :contact

            sig do
              params(
                contact:
                  HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact::OrHash
              ).void
            end
            attr_writer :contact

            sig do
              params(
                team: String,
                contact:
                  HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact::OrHash
              ).returns(T.attached_class)
            end
            def self.new(team:, contact: nil)
            end

            sig do
              override.returns(
                {
                  team: String,
                  contact:
                    HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact
                }
              )
            end
            def to_hash
            end

            class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Application::Decision::DecisionEscalated::EscalatedTo::Contact,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :email

              sig { params(email: String).void }
              attr_writer :email

              sig { returns(T.nilable(String)) }
              attr_reader :hours

              sig { params(hours: String).void }
              attr_writer :hours

              sig do
                params(email: String, hours: String).returns(T.attached_class)
              end
              def self.new(email: nil, hours: nil)
              end

              sig { override.returns({ email: String, hours: String }) }
              def to_hash
              end
            end
          end
        end

        class DecisionWithdrawn < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig do
            returns(
              HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::TaggedSymbol
            )
          end
          attr_accessor :outcome

          sig do
            returns(
              HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
            )
          end
          attr_accessor :withdrawn_by

          sig { returns(T.nilable(Time)) }
          attr_reader :withdrawn_at

          sig { params(withdrawn_at: Time).void }
          attr_writer :withdrawn_at

          # The applicant or shelter withdrew before a decision was finalized.
          sig do
            params(
              outcome:
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::OrSymbol,
              withdrawn_by:
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::OrSymbol,
              withdrawn_at: Time
            ).returns(T.attached_class)
          end
          def self.new(outcome:, withdrawn_by:, withdrawn_at: nil)
          end

          sig do
            override.returns(
              {
                outcome:
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::TaggedSymbol,
                withdrawn_by:
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol,
                withdrawn_at: Time
              }
            )
          end
          def to_hash
          end

          module Outcome
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            WITHDRAWN =
              T.let(
                :withdrawn,
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :expired,
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::Outcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module WithdrawnBy
            extend HelloWorldTestingggg::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            APPLICANT =
              T.let(
                :applicant,
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
              )
            SHELTER =
              T.let(
                :shelter,
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
              )
            SYSTEM =
              T.let(
                :system,
                HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  HelloWorldTestingggg::Application::Decision::DecisionWithdrawn::WithdrawnBy::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[HelloWorldTestingggg::Application::Decision::Variants]
          )
        end
        def self.variants
        end
      end

      class History < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Application::History,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :changed_at

        sig do
          returns(
            HelloWorldTestingggg::Application::History::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :note

        sig do
          params(
            changed_at: Time,
            status:
              HelloWorldTestingggg::Application::History::Status::OrSymbol,
            note: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(changed_at:, status:, note: nil)
        end

        sig do
          override.returns(
            {
              changed_at: Time,
              status:
                HelloWorldTestingggg::Application::History::Status::TaggedSymbol,
              note: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, HelloWorldTestingggg::Application::History::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RECEIVED =
            T.let(
              :received,
              HelloWorldTestingggg::Application::History::Status::TaggedSymbol
            )
          UNDER_REVIEW =
            T.let(
              :under_review,
              HelloWorldTestingggg::Application::History::Status::TaggedSymbol
            )
          APPROVED =
            T.let(
              :approved,
              HelloWorldTestingggg::Application::History::Status::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              HelloWorldTestingggg::Application::History::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Application::History::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class LatestRejection < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Application::LatestRejection,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :outcome

        sig do
          returns(
            HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        sig { returns(T.nilable(Time)) }
        attr_accessor :appeal_deadline

        sig do
          params(
            reason:
              HelloWorldTestingggg::Application::LatestRejection::Reason::OrSymbol,
            appeal_deadline: T.nilable(Time),
            outcome: Symbol
          ).returns(T.attached_class)
        end
        def self.new(reason:, appeal_deadline: nil, outcome: :rejected)
        end

        sig do
          override.returns(
            {
              outcome: Symbol,
              reason:
                HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol,
              appeal_deadline: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        module Reason
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Application::LatestRejection::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          POLICY =
            T.let(
              :policy,
              HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol
            )
          CAPACITY =
            T.let(
              :capacity,
              HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol
            )
          INCOMPLETE =
            T.let(
              :incomplete,
              HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Application::LatestRejection::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
