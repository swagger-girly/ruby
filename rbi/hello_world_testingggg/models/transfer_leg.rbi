# typed: strong

module HelloWorldTestingggg
  module Models
    class TransferLeg < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::TransferLeg,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(HelloWorldTestingggg::Address) }
      attr_reader :location

      sig { params(location: HelloWorldTestingggg::Address::OrHash).void }
      attr_writer :location

      sig { returns(T.nilable(HelloWorldTestingggg::TransferLeg::Contact)) }
      attr_reader :contact

      sig do
        params(contact: HelloWorldTestingggg::TransferLeg::Contact::OrHash).void
      end
      attr_writer :contact

      sig { returns(T.nilable(HelloWorldTestingggg::Money)) }
      attr_reader :cost

      sig { params(cost: HelloWorldTestingggg::Money::OrHash).void }
      attr_writer :cost

      sig { returns(T.nilable(HelloWorldTestingggg::TransferLeg::Window)) }
      attr_reader :window

      sig do
        params(window: HelloWorldTestingggg::TransferLeg::Window::OrHash).void
      end
      attr_writer :window

      sig do
        params(
          location: HelloWorldTestingggg::Address::OrHash,
          contact: HelloWorldTestingggg::TransferLeg::Contact::OrHash,
          cost: HelloWorldTestingggg::Money::OrHash,
          window: HelloWorldTestingggg::TransferLeg::Window::OrHash
        ).returns(T.attached_class)
      end
      def self.new(location:, contact: nil, cost: nil, window: nil)
      end

      sig do
        override.returns(
          {
            location: HelloWorldTestingggg::Address,
            contact: HelloWorldTestingggg::TransferLeg::Contact,
            cost: HelloWorldTestingggg::Money,
            window: HelloWorldTestingggg::TransferLeg::Window
          }
        )
      end
      def to_hash
      end

      class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::TransferLeg::Contact,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        sig { params(name: String, phone: String).returns(T.attached_class) }
        def self.new(name: nil, phone: nil)
        end

        sig { override.returns({ name: String, phone: String }) }
        def to_hash
        end
      end

      class Window < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::TransferLeg::Window,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_reader :end_

        sig { params(end_: Time).void }
        attr_writer :end_

        sig { returns(T.nilable(Time)) }
        attr_reader :start

        sig { params(start: Time).void }
        attr_writer :start

        sig { params(end_: Time, start: Time).returns(T.attached_class) }
        def self.new(end_: nil, start: nil)
        end

        sig { override.returns({ end_: Time, start: Time }) }
        def to_hash
        end
      end
    end
  end
end
