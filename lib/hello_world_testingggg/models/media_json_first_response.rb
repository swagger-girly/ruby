# frozen_string_literal: true

module HelloWorldTestingggg
  module Models
    # @see HelloWorldTestingggg::Resources::Media#json_first
    class MediaJsonFirstResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute label
      #
      #   @return [String, nil]
      optional :label, String

      # @!method initialize(id:, label: nil)
      #   @param id [String]
      #   @param label [String]
    end
  end
end
