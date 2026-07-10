# typed: strong

module HelloWorldTestingggg
  module Models
    class FileUploadParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::FileUploadParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # The file to upload.
      sig { returns(HelloWorldTestingggg::Internal::FileInput) }
      attr_accessor :file

      # Optional expiration in seconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :expires_in

      sig { params(expires_in: Integer).void }
      attr_writer :expires_in

      # Additional metadata to store with the file.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Optional storage path for the uploaded file.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      # Whether the file should be publicly readable.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :public

      sig { params(public: T::Boolean).void }
      attr_writer :public

      # Tags to associate with the file.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          file: HelloWorldTestingggg::Internal::FileInput,
          expires_in: Integer,
          metadata: T::Hash[Symbol, String],
          path: String,
          public: T::Boolean,
          tags: T::Array[String],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The file to upload.
        file:,
        # Optional expiration in seconds.
        expires_in: nil,
        # Additional metadata to store with the file.
        metadata: nil,
        # Optional storage path for the uploaded file.
        path: nil,
        # Whether the file should be publicly readable.
        public: nil,
        # Tags to associate with the file.
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: HelloWorldTestingggg::Internal::FileInput,
            expires_in: Integer,
            metadata: T::Hash[Symbol, String],
            path: String,
            public: T::Boolean,
            tags: T::Array[String],
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
