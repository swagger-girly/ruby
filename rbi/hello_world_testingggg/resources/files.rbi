# typed: strong

module HelloWorldTestingggg
  module Resources
    # File storage operations
    class Files
      # Updates a stored file with either a multipart file part or a URL.
      sig do
        params(
          path: String,
          file: HelloWorldTestingggg::Internal::FileInput,
          metadata: T::Hash[Symbol, String],
          url: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::File)
      end
      def update(
        # Path to the stored file. Slashes are preserved so docs/example.txt maps to
        # /files/docs/example.txt.
        path,
        # Replacement file content.
        file: nil,
        # Metadata to merge onto the stored file.
        metadata: nil,
        # URL to fetch replacement file content from.
        url: nil,
        request_options: {}
      )
      end

      # Returns all files in descending order.
      sig do
        params(
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Fileslist)
      end
      def list(request_options: {})
      end

      # Deletes a file while preserving slashes in the file path parameter.
      sig do
        params(
          path: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Path to the stored file. Slashes are preserved so docs/example.txt maps to
        # /files/docs/example.txt.
        path,
        request_options: {}
      )
      end

      # Uploads multiple files and nested manifest metadata as multipart/form-data.
      sig do
        params(
          files: T::Array[HelloWorldTestingggg::Internal::FileInput],
          manifest:
            HelloWorldTestingggg::FileCreateArchiveParams::Manifest::OrHash,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::Archive)
      end
      def create_archive(
        # Files to include in the archive.
        files:,
        manifest: nil,
        request_options: {}
      )
      end

      # Downloads a file while preserving slashes in the file path parameter.
      sig do
        params(
          path: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def download(
        # Path to the stored file. Slashes are preserved so docs/example.txt maps to
        # /files/docs/example.txt.
        path,
        request_options: {}
      )
      end

      # Uploads a file via multipart/form-data with metadata and optional storage path.
      sig do
        params(
          file: HelloWorldTestingggg::Internal::FileInput,
          expires_in: Integer,
          metadata: T::Hash[Symbol, String],
          path: String,
          public: T::Boolean,
          tags: T::Array[String],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::File)
      end
      def upload(
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

      # Uploads a whole request body as application/octet-stream.
      sig do
        params(
          body: HelloWorldTestingggg::Internal::FileInput,
          path: String,
          x_file_name: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(HelloWorldTestingggg::File)
      end
      def upload_direct(
        # Body param
        body:,
        # Query param: Optional storage path for the raw file.
        path: nil,
        # Header param: Optional original file name.
        x_file_name: nil,
        request_options: {}
      )
      end

      # @api private
      sig do
        params(client: HelloWorldTestingggg::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
