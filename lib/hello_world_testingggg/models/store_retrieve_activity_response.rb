# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # A store activity feed entry. Every arm composes the public `Pet` model, so each
    # one is minted under the response's namespace and inherits from `Pet` instead of
    # re-minting its inline type tree.
    #
    # @see HelloWorldTestingggg::Resources::Store#retrieve_activity
    module StoreRetrieveActivityResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      discriminator :family

      # Listing activity. Widens the base's `status` enum with a member `Pet` does not declare, so the heritage clause has to omit the redeclared key instead of extending the base plainly.
      variant :listed, -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed }

      # Sale activity. Pins the base's `status` to a single member — a provable narrowing, so this arm keeps a plain `extends` with no omitted keys.
      variant :sold, -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold }

      # Archival activity. Narrows the base's `status` by value but also makes it nullable, which `Pet` does not accept — a value subset alone is not enough to keep a plain `extends` here.
      variant :archived, -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived }

      # Transfer activity. Reaches `Pet` only through the pass-through wrapper branch, so the base is resolvable only transitively.
      variant :transferred, -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred }

      class Listed < HelloWorldTestingggg::Models::PetAPI
        # @!attribute activity_id
        #
        #   @return [String]
        required :activity_id, String, api_name: :activityId

        # @!attribute family
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family]
        required :family, enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family }

        # @!attribute recorded_at
        #
        #   @return [Time]
        required :recorded_at, Time, api_name: :recordedAt

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status]
        required :status, enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status }

        # @!method initialize(activity_id:, family:, recorded_at:, status:)
        #   Listing activity. Widens the base's `status` enum with a member `Pet` does not
        #   declare, so the heritage clause has to omit the redeclared key instead of
        #   extending the base plainly.
        #
        #   @param activity_id [String]
        #   @param family [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family]
        #   @param recorded_at [Time]
        #   @param status [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status]

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          LISTED = :listed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          AVAILABLE = :available
          PENDING = :pending
          SOLD = :sold
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Sold < HelloWorldTestingggg::Models::PetAPI
        # @!attribute activity_id
        #
        #   @return [String]
        required :activity_id, String, api_name: :activityId

        # @!attribute family
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family]
        required :family, enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family }

        # @!attribute recorded_at
        #
        #   @return [Time]
        required :recorded_at, Time, api_name: :recordedAt

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status]
        required :status, enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status }

        # @!method initialize(activity_id:, family:, recorded_at:, status:)
        #   Sale activity. Pins the base's `status` to a single member — a provable
        #   narrowing, so this arm keeps a plain `extends` with no omitted keys.
        #
        #   @param activity_id [String]
        #   @param family [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family]
        #   @param recorded_at [Time]
        #   @param status [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status]

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          SOLD = :sold

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          SOLD = :sold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Archived < HelloWorldTestingggg::Models::PetAPI
        # @!attribute activity_id
        #
        #   @return [String]
        required :activity_id, String, api_name: :activityId

        # @!attribute family
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family]
        required :family,
                 enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family }

        # @!attribute recorded_at
        #
        #   @return [Time]
        required :recorded_at, Time, api_name: :recordedAt

        # @!attribute archived_reason
        #
        #   @return [String, nil]
        optional :archived_reason, String, api_name: :archivedReason

        # @!attribute status
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status, nil]
        optional :status,
                 enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status },
                 nil?: true

        # @!method initialize(activity_id:, family:, recorded_at:, archived_reason: nil, status: nil)
        #   Archival activity. Narrows the base's `status` by value but also makes it
        #   nullable, which `Pet` does not accept — a value subset alone is not enough to
        #   keep a plain `extends` here.
        #
        #   @param activity_id [String]
        #   @param family [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family]
        #   @param recorded_at [Time]
        #   @param archived_reason [String]
        #   @param status [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status, nil]

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          SOLD = :sold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Transferred < HelloWorldTestingggg::Models::PetAPI
        # @!attribute family
        #
        #   @return [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family]
        required :family,
                 enum: -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family }

        # @!attribute transferred_to
        #
        #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo, nil]
        optional :transferred_to,
                 -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo },
                 api_name: :transferredTo

        # @!method initialize(family:, transferred_to: nil)
        #   Transfer activity. Reaches `Pet` only through the pass-through wrapper branch,
        #   so the base is resolvable only transitively.
        #
        #   @param family [Symbol, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family]
        #   @param transferred_to [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo]

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          TRANSFERRED = :transferred

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TransferredTo < HelloWorldTestingggg::Internal::Type::BaseModel
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
          #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact, nil]
          optional :contact,
                   -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact }

          # @!attribute location
          #
          #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location, nil]
          optional :location,
                   -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location }

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
          #   @param contact [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact]
          #   @param location [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location]
          #   @param related_address [HelloWorldTestingggg::Models::Address]
          #   @param related_category [Object]
          #   @param related_customer [Object]
          #   @param related_money [HelloWorldTestingggg::Models::Money]
          #   @param related_order [Object]
          #   @param related_pet [HelloWorldTestingggg::Models::PetAPI]
          #   @param related_tag [Object]
          #   @param related_user [Object]

          # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo#contact
          class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
            # @!attribute primary
            #
            #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary, nil]
            optional :primary,
                     -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary }

            # @!method initialize(primary: nil)
            #   @param primary [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary]

            # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact#primary
            class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
              # @!attribute availability
              #
              #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability, nil]
              optional :availability,
                       -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability }

              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String

              # @!attribute phone
              #
              #   @return [String, nil]
              optional :phone, String

              # @!method initialize(availability: nil, name: nil, phone: nil)
              #   @param availability [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability]
              #   @param name [String]
              #   @param phone [String]

              # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary#availability
              class Availability < HelloWorldTestingggg::Internal::Type::BaseModel
                # @!attribute weekday
                #
                #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday, nil]
                optional :weekday,
                         -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday }

                # @!attribute weekend
                #
                #   @return [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend, nil]
                optional :weekend,
                         -> { HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend },
                         nil?: true

                # @!method initialize(weekday: nil, weekend: nil)
                #   @param weekday [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday]
                #   @param weekend [HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend, nil]

                # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability#weekday
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

                # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability#weekend
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

          # @see HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo#location
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
      #   @return [Array(HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived, HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred)]
    end
  end
end
