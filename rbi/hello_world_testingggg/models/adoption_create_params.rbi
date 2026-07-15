# typed: strong

module HelloWorldTestingggg
  module Models
    class AdoptionCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::AdoptionCreateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            HelloWorldTestingggg::AdoptionCreateParams::Body::Individual,
            HelloWorldTestingggg::AdoptionCreateParams::Body::Organization
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              HelloWorldTestingggg::AdoptionCreateParams::Body::Individual::OrHash,
              HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::OrHash
            ),
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, request_options: {})
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                HelloWorldTestingggg::AdoptionCreateParams::Body::Individual,
                HelloWorldTestingggg::AdoptionCreateParams::Body::Organization
              ),
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
              HelloWorldTestingggg::AdoptionCreateParams::Body::Individual,
              HelloWorldTestingggg::AdoptionCreateParams::Body::Organization
            )
          end

        class Individual < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::AdoptionCreateParams::Body::Individual,
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
                HelloWorldTestingggg::AdoptionCreateParams::Body::Organization,
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
                HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter
              )
            )
          end
          attr_reader :shelter

          sig do
            params(
              shelter:
                HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::OrHash
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
                HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::OrHash,
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
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter,
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
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter,
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
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact
                )
              )
            end
            attr_reader :contact

            sig do
              params(
                contact:
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::OrHash
              ).void
            end
            attr_writer :contact

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location
                )
              )
            end
            attr_reader :location

            sig do
              params(
                location:
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location::OrHash
              ).void
            end
            attr_writer :location

            sig do
              params(
                name: String,
                address: HelloWorldTestingggg::Address::OrHash,
                contact:
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::OrHash,
                location:
                  HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location::OrHash
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
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact,
                  location:
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location
                }
              )
            end
            def to_hash
            end

            class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary
                  )
                )
              end
              attr_reader :primary

              sig do
                params(
                  primary:
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::OrHash
                ).void
              end
              attr_writer :primary

              sig do
                params(
                  primary:
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::OrHash
                ).returns(T.attached_class)
              end
              def self.new(primary: nil)
              end

              sig do
                override.returns(
                  {
                    primary:
                      HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary
                  }
                )
              end
              def to_hash
              end

              class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary,
                      HelloWorldTestingggg::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    T.nilable(
                      HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability
                    )
                  )
                end
                attr_reader :availability

                sig do
                  params(
                    availability:
                      HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::OrHash
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
                      HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::OrHash,
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
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability,
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
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability,
                        HelloWorldTestingggg::Internal::AnyHash
                      )
                    end

                  sig do
                    returns(
                      T.nilable(
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday
                      )
                    )
                  end
                  attr_reader :weekday

                  sig do
                    params(
                      weekday:
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday::OrHash
                    ).void
                  end
                  attr_writer :weekday

                  sig do
                    returns(
                      T.nilable(
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend
                      )
                    )
                  end
                  attr_reader :weekend

                  sig do
                    params(
                      weekend:
                        T.nilable(
                          HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend::OrHash
                        )
                    ).void
                  end
                  attr_writer :weekend

                  sig do
                    params(
                      weekday:
                        HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday::OrHash,
                      weekend:
                        T.nilable(
                          HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend::OrHash
                        )
                    ).returns(T.attached_class)
                  end
                  def self.new(weekday: nil, weekend: nil)
                  end

                  sig do
                    override.returns(
                      {
                        weekday:
                          HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday,
                        weekend:
                          T.nilable(
                            HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend
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
                          HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday,
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
                          HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend,
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
                    HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location,
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
            T::Array[HelloWorldTestingggg::AdoptionCreateParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
