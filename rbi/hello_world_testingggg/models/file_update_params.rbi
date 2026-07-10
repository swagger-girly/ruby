# typed: strong

module HelloWorldTestingggg
  module Models
    class FileUpdateParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::FileUpdateParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :path

      # Replacement file content.
      sig { returns(T.nilable(HelloWorldTestingggg::Internal::FileInput)) }
      attr_reader :file

      sig { params(file: HelloWorldTestingggg::Internal::FileInput).void }
      attr_writer :file

      # Metadata to merge onto the stored file.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # URL to fetch replacement file content from.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          path: String,
          file: HelloWorldTestingggg::Internal::FileInput,
          metadata: T::Hash[Symbol, String],
          url: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        path:,
        # Replacement file content.
        file: nil,
        # Metadata to merge onto the stored file.
        metadata: nil,
        # URL to fetch replacement file content from.
        url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            path: String,
            file: HelloWorldTestingggg::Internal::FileInput,
            metadata: T::Hash[Symbol, String],
            url: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
