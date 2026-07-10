# typed: strong

module HelloWorldTestingggg
  module Models
    class File < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::File,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Timestamp when the file was last modified.
      sig { returns(Time) }
      attr_accessor :last_modified

      # Path to the file in storage.
      sig { returns(String) }
      attr_accessor :path

      # Size of the file in bytes.
      sig { returns(Integer) }
      attr_accessor :size

      # Detected MIME type for the file.
      sig { returns(T.nilable(String)) }
      attr_reader :content_type

      sig { params(content_type: String).void }
      attr_writer :content_type

      sig do
        params(
          last_modified: Time,
          path: String,
          size: Integer,
          content_type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp when the file was last modified.
        last_modified:,
        # Path to the file in storage.
        path:,
        # Size of the file in bytes.
        size:,
        # Detected MIME type for the file.
        content_type: nil
      )
      end

      sig do
        override.returns(
          {
            last_modified: Time,
            path: String,
            size: Integer,
            content_type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
