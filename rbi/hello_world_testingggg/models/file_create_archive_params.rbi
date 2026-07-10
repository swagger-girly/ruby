# typed: strong

module HelloWorldTestingggg
  module Models
    class FileCreateArchiveParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::FileCreateArchiveParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Files to include in the archive.
      sig { returns(T::Array[HelloWorldTestingggg::Internal::FileInput]) }
      attr_accessor :files

      sig do
        returns(
          T.nilable(HelloWorldTestingggg::FileCreateArchiveParams::Manifest)
        )
      end
      attr_reader :manifest

      sig do
        params(
          manifest:
            HelloWorldTestingggg::FileCreateArchiveParams::Manifest::OrHash
        ).void
      end
      attr_writer :manifest

      sig do
        params(
          files: T::Array[HelloWorldTestingggg::Internal::FileInput],
          manifest:
            HelloWorldTestingggg::FileCreateArchiveParams::Manifest::OrHash,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Files to include in the archive.
        files:,
        manifest: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            files: T::Array[HelloWorldTestingggg::Internal::FileInput],
            manifest: HelloWorldTestingggg::FileCreateArchiveParams::Manifest,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Manifest < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::FileCreateArchiveParams::Manifest,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :labels

        sig { params(labels: T::Array[String]).void }
        attr_writer :labels

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :preserve_paths

        sig { params(preserve_paths: T::Boolean).void }
        attr_writer :preserve_paths

        sig do
          params(
            name: String,
            labels: T::Array[String],
            preserve_paths: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(name:, labels: nil, preserve_paths: nil)
        end

        sig do
          override.returns(
            {
              name: String,
              labels: T::Array[String],
              preserve_paths: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
