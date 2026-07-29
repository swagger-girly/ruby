# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Adoptions#create
    class AdoptionCreateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Individual, HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization]
      required :body, union: -> { HelloWorldTestingggg::AdoptionCreateParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Individual, HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization]
      #   @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}]

      module Body
        extend HelloWorldTestingggg::Internal::Type::Union

        discriminator :applicant_type

        variant :individual, -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Individual }

        variant :organization, -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization }

        class Individual < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute applicant_type
          #
          #   @return [Symbol, :individual]
          required :applicant_type, const: :individual

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute address
          #
          #   @return [HelloWorldTestingggg::Models::Address, nil]
          optional :address, -> { HelloWorldTestingggg::Address }

          # @!attribute age
          #
          #   @return [Integer, nil]
          optional :age, Integer

          # @!attribute email
          #
          #   @return [String, nil]
          optional :email, String

          # @!method initialize(name:, address: nil, age: nil, email: nil, applicant_type: :individual)
          #   @param name [String]
          #   @param address [HelloWorldTestingggg::Models::Address]
          #   @param age [Integer]
          #   @param email [String]
          #   @param applicant_type [Symbol, :individual]
        end

        class Organization < HelloWorldTestingggg::Internal::Type::BaseModel
          # @!attribute applicant_type
          #
          #   @return [Symbol, :organization]
          required :applicant_type, const: :organization

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute shelter
          #
          #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter, nil]
          optional :shelter, -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter }

          # @!attribute tax_id
          #
          #   @return [String, nil]
          optional :tax_id, String, api_name: :taxId

          # @!method initialize(name:, shelter: nil, tax_id: nil, applicant_type: :organization)
          #   @param name [String]
          #   @param shelter [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter]
          #   @param tax_id [String]
          #   @param applicant_type [Symbol, :organization]

          # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization#shelter
          class Shelter < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute address
            #
            #   @return [HelloWorldTestingggg::Models::Address, nil]
            optional :address, -> { HelloWorldTestingggg::Address }

            # @!attribute contact
            #
            #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact, nil]
            optional :contact, -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact }

            # @!attribute location
            #
            #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Location, nil]
            optional :location,
                     -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Location }

            # @!attribute related_address
            #
            #   @return [HelloWorldTestingggg::Models::Address, nil]
            optional :related_address, -> { HelloWorldTestingggg::Address }, api_name: :relatedAddress

            # @!attribute related_category
            #
            #   @return [Object, nil]
            optional :related_category,
                     HelloWorldTestingggg::Internal::Type::Unknown,
                     api_name: :relatedCategory

            # @!attribute related_customer
            #
            #   @return [Object, nil]
            optional :related_customer,
                     HelloWorldTestingggg::Internal::Type::Unknown,
                     api_name: :relatedCustomer

            # @!attribute related_money
            #
            #   @return [HelloWorldTestingggg::Models::Money, nil]
            optional :related_money, -> { HelloWorldTestingggg::Money }, api_name: :relatedMoney

            # @!attribute related_order
            #
            #   @return [Object, nil]
            optional :related_order, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedOrder

            # @!attribute related_pet
            #
            #   @return [HelloWorldTestingggg::Models::PetAPI, nil]
            optional :related_pet, -> { HelloWorldTestingggg::PetAPI }, api_name: :relatedPet

            # @!attribute related_tag
            #
            #   @return [Object, nil]
            optional :related_tag, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedTag

            # @!attribute related_user
            #
            #   @return [Object, nil]
            optional :related_user, HelloWorldTestingggg::Internal::Type::Unknown, api_name: :relatedUser

            # @!method initialize(name:, address: nil, contact: nil, location: nil, related_address: nil, related_category: nil, related_customer: nil, related_money: nil, related_order: nil, related_pet: nil, related_tag: nil, related_user: nil)
            #   @param name [String]
            #   @param address [HelloWorldTestingggg::Models::Address]
            #   @param contact [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact]
            #   @param location [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Location]
            #   @param related_address [HelloWorldTestingggg::Models::Address]
            #   @param related_category [Object]
            #   @param related_customer [Object]
            #   @param related_money [HelloWorldTestingggg::Models::Money]
            #   @param related_order [Object]
            #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
            #   @param related_tag [Object]
            #   @param related_user [Object]

            # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter#contact
            class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute primary
              #
              #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary, nil]
              optional :primary,
                       -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary }

              # @!method initialize(primary: nil)
              #   @param primary [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary]

              # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact#primary
              class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
                # @!attribute availability
                #
                #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability, nil]
                optional :availability,
                         -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability }

                # @!attribute name
                #
                #   @return [String, nil]
                optional :name, String

                # @!attribute phone
                #
                #   @return [String, nil]
                optional :phone, String

                # @!method initialize(availability: nil, name: nil, phone: nil)
                #   @param availability [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability]
                #   @param name [String]
                #   @param phone [String]

                # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary#availability
                class Availability < HelloWorldTestingggg::Internal::Type::BaseModel
                  # @!attribute weekday
                  #
                  #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday, nil]
                  optional :weekday,
                           -> { HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday }

                  # @!attribute weekend
                  #
                  #   @return [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend, nil]
                  optional :weekend,
                           -> {
                             HelloWorldTestingggg::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend
                           },
                           nil?: true

                  # @!method initialize(weekday: nil, weekend: nil)
                  #   @param weekday [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekday]
                  #   @param weekend [HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability::Weekend, nil]

                  # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability#weekday
                  class Weekday < HelloWorldTestingggg::Internal::Type::BaseModel
                    # @!attribute close
                    #
                    #   @return [String, nil]
                    optional :close, String

                    # @!attribute open_
                    #
                    #   @return [String, nil]
                    optional :open_, String, api_name: :open

                    # @!method initialize(close: nil, open_: nil)
                    #   @param close [String]
                    #   @param open_ [String]
                  end

                  # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter::Contact::Primary::Availability#weekend
                  class Weekend < HelloWorldTestingggg::Internal::Type::BaseModel
                    # @!attribute close
                    #
                    #   @return [String, nil]
                    optional :close, String

                    # @!attribute open_
                    #
                    #   @return [String, nil]
                    optional :open_, String, api_name: :open

                    # @!method initialize(close: nil, open_: nil)
                    #   @param close [String]
                    #   @param open_ [String]
                  end
                end
              end
            end

            # @see HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization::Shelter#location
            class Location < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute latitude
              #
              #   @return [Float]
              required :latitude, Float

              # @!attribute longitude
              #
              #   @return [Float]
              required :longitude, Float

              # @!method initialize(latitude:, longitude:)
              #   @param latitude [Float]
              #   @param longitude [Float]
            end
          end
        end

        # @!method self.variants
        #   @return [Array(HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Individual, HelloWorldTestingggg::Models::AdoptionCreateParams::Body::Organization)]
      end
    end
  end
end
