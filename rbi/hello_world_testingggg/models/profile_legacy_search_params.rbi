# typed: strong

module HelloWorldTestingggg
  module Models
    class ProfileLegacySearchParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::ProfileLegacySearchParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Whether archived profiles should be included.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_archived

      sig { params(include_archived: T::Boolean).void }
      attr_writer :include_archived

      # Legacy free-text search string.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      sig do
        params(
          include_archived: T::Boolean,
          q: String,
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether archived profiles should be included.
        include_archived: nil,
        # Legacy free-text search string.
        q: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            include_archived: T::Boolean,
            q: String,
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
