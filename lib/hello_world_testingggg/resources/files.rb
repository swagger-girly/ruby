# frozen_string_literal: true

module HelloWorldTestingggg
  module Resources
    # File storage operations
    class Files
      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::FileUpdateParams} for more details.
      #
      # Updates a stored file with either a multipart file part or a URL.
      #
      # @overload update(path, file: nil, metadata: nil, url: nil, request_options: {})
      #
      # @param path [String] Path to the stored file. Slashes are preserved so docs/example.txt maps to /file
      #
      # @param file [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] Replacement file content.
      #
      # @param metadata [Hash{Symbol=>String}] Metadata to merge onto the stored file.
      #
      # @param url [String] URL to fetch replacement file content from.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::File]
      #
      # @see HelloWorldTestingggg::Models::FileUpdateParams
      def update(path, params = {})
        parsed, options = HelloWorldTestingggg::FileUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["files/%1$s", path],
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: HelloWorldTestingggg::File,
          options: options
        )
      end

      # Returns all files in descending order.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Fileslist]
      #
      # @see HelloWorldTestingggg::Models::FileListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "files",
          model: HelloWorldTestingggg::Fileslist,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::FileDeleteParams} for more details.
      #
      # Deletes a file while preserving slashes in the file path parameter.
      #
      # @overload delete(path, request_options: {})
      #
      # @param path [String] Path to the stored file. Slashes are preserved so docs/example.txt maps to /file
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see HelloWorldTestingggg::Models::FileDeleteParams
      def delete(path, params = {})
        @client.request(
          method: :delete,
          path: ["files/%1$s", path],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Uploads multiple files and nested manifest metadata as multipart/form-data.
      #
      # @overload create_archive(files:, manifest: nil, request_options: {})
      #
      # @param files [Array<Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart>] Files to include in the archive.
      #
      # @param manifest [HelloWorldTestingggg::Models::FileCreateArchiveParams::Manifest]
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::Archive]
      #
      # @see HelloWorldTestingggg::Models::FileCreateArchiveParams
      def create_archive(params)
        parsed, options = HelloWorldTestingggg::FileCreateArchiveParams.dump_request(params)
        @client.request(
          method: :post,
          path: "files/archive",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: HelloWorldTestingggg::Archive,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {HelloWorldTestingggg::Models::FileDownloadParams} for more details.
      #
      # Downloads a file while preserving slashes in the file path parameter.
      #
      # @overload download(path, request_options: {})
      #
      # @param path [String] Path to the stored file. Slashes are preserved so docs/example.txt maps to /file
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see HelloWorldTestingggg::Models::FileDownloadParams
      def download(path, params = {})
        @client.request(
          method: :get,
          path: ["files/%1$s", path],
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: params[:request_options]
        )
      end

      # Uploads a file via multipart/form-data with metadata and optional storage path.
      #
      # @overload upload(file:, expires_in: nil, metadata: nil, path: nil, public: nil, tags: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] The file to upload.
      #
      # @param expires_in [Integer] Optional expiration in seconds.
      #
      # @param metadata [Hash{Symbol=>String}] Additional metadata to store with the file.
      #
      # @param path [String] Optional storage path for the uploaded file.
      #
      # @param public [Boolean] Whether the file should be publicly readable.
      #
      # @param tags [Array<String>] Tags to associate with the file.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::File]
      #
      # @see HelloWorldTestingggg::Models::FileUploadParams
      def upload(params)
        parsed, options = HelloWorldTestingggg::FileUploadParams.dump_request(params)
        @client.request(
          method: :post,
          path: "files",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: HelloWorldTestingggg::File,
          options: options
        )
      end

      # Uploads a whole request body as application/octet-stream.
      #
      # @overload upload_direct(body:, path: nil, x_file_name: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, HelloWorldTestingggg::FilePart] Body param
      #
      # @param path [String] Query param: Optional storage path for the raw file.
      #
      # @param x_file_name [String] Header param: Optional original file name.
      #
      # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [HelloWorldTestingggg::Models::File]
      #
      # @see HelloWorldTestingggg::Models::FileUploadDirectParams
      def upload_direct(params)
        query_params = [:path]
        parsed, options = HelloWorldTestingggg::FileUploadDirectParams.dump_request(params)
        query = HelloWorldTestingggg::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "files/direct",
          query: parsed.slice(*query_params),
          headers: {
            "content-type" => "application/octet-stream",
            **parsed.except(:body, *query_params)
          }.transform_keys(
            x_file_name: "x-file-name"
          ),
          body: parsed[:body],
          model: HelloWorldTestingggg::File,
          options: options
        )
      end

      # @api private
      #
      # @param client [HelloWorldTestingggg::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
