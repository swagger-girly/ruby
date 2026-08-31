# typed: strong

module HelloWorldTestingggg
  module Models
    # A store activity feed entry. Every arm composes the public `Pet` model, so each
    # one is minted under the response's namespace and inherits from `Pet` instead of
    # re-minting its inline type tree.
    module StoreRetrieveActivityResponse
      extend HelloWorldTestingggg::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed,
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold,
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived,
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred
          )
        end

      class Listed < HelloWorldTestingggg::Models::PetAPI
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :activity_id

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family::TaggedSymbol
          )
        end
        attr_accessor :family

        sig { returns(Time) }
        attr_accessor :recorded_at

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Listing activity. Widens the base's `status` enum with a member `Pet` does not
        # declare, so the heritage clause has to omit the redeclared key instead of
        # extending the base plainly.
        sig do
          params(
            activity_id: String,
            family:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family::OrSymbol,
            recorded_at: Time,
            status:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(activity_id:, family:, recorded_at:, status:)
        end

        sig do
          override.returns(
            {
              activity_id: String,
              family:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family::TaggedSymbol,
              recorded_at: Time,
              status:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LISTED =
            T.let(
              :listed,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Family::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AVAILABLE =
            T.let(
              :available,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
            )
          SOLD =
            T.let(
              :sold,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
            )
          ARCHIVED =
            T.let(
              :archived,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Listed::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Sold < HelloWorldTestingggg::Models::PetAPI
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :activity_id

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family::TaggedSymbol
          )
        end
        attr_accessor :family

        sig { returns(Time) }
        attr_accessor :recorded_at

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Sale activity. Pins the base's `status` to a single member — a provable
        # narrowing, so this arm keeps a plain `extends` with no omitted keys.
        sig do
          params(
            activity_id: String,
            family:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family::OrSymbol,
            recorded_at: Time,
            status:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(activity_id:, family:, recorded_at:, status:)
        end

        sig do
          override.returns(
            {
              activity_id: String,
              family:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family::TaggedSymbol,
              recorded_at: Time,
              status:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SOLD =
            T.let(
              :sold,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Family::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SOLD =
            T.let(
              :sold,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Sold::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Archived < HelloWorldTestingggg::Models::PetAPI
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :activity_id

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family::TaggedSymbol
          )
        end
        attr_accessor :family

        sig { returns(Time) }
        attr_accessor :recorded_at

        sig { returns(T.nilable(String)) }
        attr_reader :archived_reason

        sig { params(archived_reason: String).void }
        attr_writer :archived_reason

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status::TaggedSymbol
            )
          )
        end
        attr_accessor :status

        # Archival activity. Narrows the base's `status` by value but also makes it
        # nullable, which `Pet` does not accept — a value subset alone is not enough to
        # keep a plain `extends` here.
        sig do
          params(
            activity_id: String,
            family:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family::OrSymbol,
            recorded_at: Time,
            archived_reason: String,
            status:
              T.nilable(
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          activity_id:,
          family:,
          recorded_at:,
          archived_reason: nil,
          status: nil
        )
        end

        sig do
          override.returns(
            {
              activity_id: String,
              family:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family::TaggedSymbol,
              recorded_at: Time,
              archived_reason: String,
              status:
                T.nilable(
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status::TaggedSymbol
                )
            }
          )
        end
        def to_hash
        end

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ARCHIVED =
            T.let(
              :archived,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Family::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SOLD =
            T.let(
              :sold,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Archived::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Transferred < HelloWorldTestingggg::Models::PetAPI
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig do
          returns(
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family::TaggedSymbol
          )
        end
        attr_accessor :family

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo
            )
          )
        end
        attr_reader :transferred_to

        sig do
          params(
            transferred_to:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::OrHash
          ).void
        end
        attr_writer :transferred_to

        # Transfer activity. Reaches `Pet` only through the pass-through wrapper branch,
        # so the base is resolvable only transitively.
        sig do
          params(
            family:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family::OrSymbol,
            transferred_to:
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(family:, transferred_to: nil)
        end

        sig do
          override.returns(
            {
              family:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family::TaggedSymbol,
              transferred_to:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo
            }
          )
        end
        def to_hash
        end

        module Family
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRANSFERRED =
            T.let(
              :transferred,
              HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::Family::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TransferredTo < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo,
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
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact
              )
            )
          end
          attr_reader :contact

          sig do
            params(
              contact:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::OrHash
            ).void
          end
          attr_writer :contact

          sig do
            returns(
              T.nilable(
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location
              )
            )
          end
          attr_reader :location

          sig do
            params(
              location:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location::OrHash
            ).void
          end
          attr_writer :location

          sig { returns(T.nilable(HelloWorldTestingggg::Address)) }
          attr_reader :related_address

          sig do
            params(related_address: HelloWorldTestingggg::Address::OrHash).void
          end
          attr_writer :related_address

          sig { returns(T.nilable(T.anything)) }
          attr_reader :related_category

          sig { params(related_category: T.anything).void }
          attr_writer :related_category

          sig { returns(T.nilable(T.anything)) }
          attr_reader :related_customer

          sig { params(related_customer: T.anything).void }
          attr_writer :related_customer

          sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
          attr_reader :related_money

          sig do
            params(related_money: HelloWorldTestingggg::Money::OrHash).void
          end
          attr_writer :related_money

          sig { returns(T.nilable(T.anything)) }
          attr_reader :related_order

          sig { params(related_order: T.anything).void }
          attr_writer :related_order

          sig { returns(T.nilable(HelloWorldTestingggg::PetAPI)) }
          attr_reader :related_pet

          sig { params(related_pet: HelloWorldTestingggg::PetAPI::OrHash).void }
          attr_writer :related_pet

          sig { returns(T.nilable(T.anything)) }
          attr_reader :related_tag

          sig { params(related_tag: T.anything).void }
          attr_writer :related_tag

          sig { returns(T.nilable(T.anything)) }
          attr_reader :related_user

          sig { params(related_user: T.anything).void }
          attr_writer :related_user

          sig do
            params(
              name: String,
              address: HelloWorldTestingggg::Address::OrHash,
              contact:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::OrHash,
              location:
                HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location::OrHash,
              related_address: HelloWorldTestingggg::Address::OrHash,
              related_category: T.anything,
              related_customer: T.anything,
              related_money: HelloWorldTestingggg::Money::OrHash,
              related_order: T.anything,
              related_pet: HelloWorldTestingggg::PetAPI::OrHash,
              related_tag: T.anything,
              related_user: T.anything
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            address: nil,
            contact: nil,
            location: nil,
            related_address: nil,
            related_category: nil,
            related_customer: nil,
            related_money: nil,
            related_order: nil,
            related_pet: nil,
            related_tag: nil,
            related_user: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                address: HelloWorldTestingggg::Address,
                contact:
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact,
                location:
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location,
                related_address: HelloWorldTestingggg::Address,
                related_category: T.anything,
                related_customer: T.anything,
                related_money: HelloWorldTestingggg::Money,
                related_order: T.anything,
                related_pet: HelloWorldTestingggg::PetAPI,
                related_tag: T.anything,
                related_user: T.anything
              }
            )
          end
          def to_hash
          end

          class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact,
                  HelloWorldTestingggg::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary
                )
              )
            end
            attr_reader :primary

            sig do
              params(
                primary:
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::OrHash
              ).void
            end
            attr_writer :primary

            sig do
              params(
                primary:
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::OrHash
              ).returns(T.attached_class)
            end
            def self.new(primary: nil)
            end

            sig do
              override.returns(
                {
                  primary:
                    HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary
                }
              )
            end
            def to_hash
            end

            class Primary < HelloWorldTestingggg::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary,
                    HelloWorldTestingggg::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability
                  )
                )
              end
              attr_reader :availability

              sig do
                params(
                  availability:
                    HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::OrHash
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
                    HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::OrHash,
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
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability,
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
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability,
                      HelloWorldTestingggg::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    T.nilable(
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday
                    )
                  )
                end
                attr_reader :weekday

                sig do
                  params(
                    weekday:
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday::OrHash
                  ).void
                end
                attr_writer :weekday

                sig do
                  returns(
                    T.nilable(
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend
                    )
                  )
                end
                attr_reader :weekend

                sig do
                  params(
                    weekend:
                      T.nilable(
                        HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend::OrHash
                      )
                  ).void
                end
                attr_writer :weekend

                sig do
                  params(
                    weekday:
                      HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday::OrHash,
                    weekend:
                      T.nilable(
                        HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend::OrHash
                      )
                  ).returns(T.attached_class)
                end
                def self.new(weekday: nil, weekend: nil)
                end

                sig do
                  override.returns(
                    {
                      weekday:
                        HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday,
                      weekend:
                        T.nilable(
                          HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend
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
                        HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekday,
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
                        HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Contact::Primary::Availability::Weekend,
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
                  HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Transferred::TransferredTo::Location,
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
          T::Array[
            HelloWorldTestingggg::Models::StoreRetrieveActivityResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
