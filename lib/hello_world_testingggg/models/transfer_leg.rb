# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    class TransferLeg < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute location
      #
      #   @return [HelloWorldTestingggg::Models::Address]
      required :location, -> { HelloWorldTestingggg::Address }

      # @!attribute contact
      #
      #   @return [HelloWorldTestingggg::Models::TransferLeg::Contact, nil]
      optional :contact, -> { HelloWorldTestingggg::TransferLeg::Contact }

      # @!attribute cost
      #
      #   @return [HelloWorldTestingggg::Models::Money, nil]
      optional :cost, -> { HelloWorldTestingggg::Money }

      # @!attribute window
      #
      #   @return [HelloWorldTestingggg::Models::TransferLeg::Window, nil]
      optional :window, -> { HelloWorldTestingggg::TransferLeg::Window }

      # @!method initialize(location:, contact: nil, cost: nil, window: nil)
      #   @param location [HelloWorldTestingggg::Models::Address]
      #   @param contact [HelloWorldTestingggg::Models::TransferLeg::Contact]
      #   @param cost [HelloWorldTestingggg::Models::Money]
      #   @param window [HelloWorldTestingggg::Models::TransferLeg::Window]

      # @see HelloWorldTestingggg::Models::TransferLeg#contact
      class Contact < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute phone
        #
        #   @return [String, nil]
        optional :phone, String

        # @!method initialize(name: nil, phone: nil)
        #   @param name [String]
        #   @param phone [String]
      end

      # @see HelloWorldTestingggg::Models::TransferLeg#window
      class Window < HelloWorldTestingggg::Internal::Type::BaseModel
        # @!attribute end_
        #
        #   @return [Time, nil]
        optional :end_, Time, api_name: :end

        # @!attribute start
        #
        #   @return [Time, nil]
        optional :start, Time

        # @!method initialize(end_: nil, start: nil)
        #   @param end_ [Time]
        #   @param start [Time]
      end
    end
  end
end
