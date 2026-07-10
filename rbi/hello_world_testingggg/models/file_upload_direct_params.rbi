# typed: strong

module HelloWorldTestingggg
  module Models
    class FileUploadDirectParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::FileUploadDirectParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      sig { returns(HelloWorldTestingggg::Internal::FileInput) }
      attr_accessor :body

      # Optional storage path for the raw file.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      sig { returns(T.nilable(String)) }
      attr_reader :x_file_name

      sig { params(x_file_name: String).void }
      attr_writer :x_file_name

      sig do
        params(
          body: HelloWorldTestingggg::Internal::FileInput,
          path: String,
          x_file_name: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        # Optional storage path for the raw file.
        path: nil,
        x_file_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: HelloWorldTestingggg::Internal::FileInput,
            path: String,
            x_file_name: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
