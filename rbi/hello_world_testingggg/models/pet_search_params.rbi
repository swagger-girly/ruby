# typed: strong

module HelloWorldTestingggg
  module Models
    class PetSearchParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::PetSearchParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Object-schema query parameter: mints a typed params model instead of collapsing
      # to a bare object.
      sig { returns(T.nilable(HelloWorldTestingggg::PetSearchParams::Filters)) }
      attr_reader :filters

      sig do
        params(
          filters: HelloWorldTestingggg::PetSearchParams::Filters::OrHash
        ).void
      end
      attr_writer :filters

      # Scalar query parameter: stays a plain scalar (control probe).
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_results

      sig { params(max_results: Integer).void }
      attr_writer :max_results

      # Empty-object query parameter (additionalProperties:false): stays a bare object,
      # exercising the empty-object branch.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :raw_filter

      sig { params(raw_filter: T.anything).void }
      attr_writer :raw_filter

      # Array-of-object query parameter: emitters mint a singularized element type for
      # each item.
      sig do
        returns(
          T.nilable(T::Array[HelloWorldTestingggg::PetSearchParams::TagFilter])
        )
      end
      attr_reader :tag_filters

      sig do
        params(
          tag_filters:
            T::Array[HelloWorldTestingggg::PetSearchParams::TagFilter::OrHash]
        ).void
      end
      attr_writer :tag_filters

      sig do
        params(
          filters: HelloWorldTestingggg::PetSearchParams::Filters::OrHash,
          max_results: Integer,
          raw_filter: T.anything,
          tag_filters:
            T::Array[HelloWorldTestingggg::PetSearchParams::TagFilter::OrHash],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Object-schema query parameter: mints a typed params model instead of collapsing
        # to a bare object.
        filters: nil,
        # Scalar query parameter: stays a plain scalar (control probe).
        max_results: nil,
        # Empty-object query parameter (additionalProperties:false): stays a bare object,
        # exercising the empty-object branch.
        raw_filter: nil,
        # Array-of-object query parameter: emitters mint a singularized element type for
        # each item.
        tag_filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            filters: HelloWorldTestingggg::PetSearchParams::Filters,
            max_results: Integer,
            raw_filter: T.anything,
            tag_filters:
              T::Array[HelloWorldTestingggg::PetSearchParams::TagFilter],
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Filters < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetSearchParams::Filters,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :color

        sig { params(color: String).void }
        attr_writer :color

        sig { returns(T.nilable(Integer)) }
        attr_reader :size

        sig { params(size: Integer).void }
        attr_writer :size

        # Object-schema query parameter: mints a typed params model instead of collapsing
        # to a bare object.
        sig { params(color: String, size: Integer).returns(T.attached_class) }
        def self.new(color: nil, size: nil)
        end

        sig { override.returns({ color: String, size: Integer }) }
        def to_hash
        end
      end

      class TagFilter < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::PetSearchParams::TagFilter,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::PetSearchParams::TagFilter::Match::OrSymbol
            )
          )
        end
        attr_reader :match

        sig do
          params(
            match:
              HelloWorldTestingggg::PetSearchParams::TagFilter::Match::OrSymbol
          ).void
        end
        attr_writer :match

        sig do
          params(
            key: String,
            match:
              HelloWorldTestingggg::PetSearchParams::TagFilter::Match::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(key: nil, match: nil)
        end

        sig do
          override.returns(
            {
              key: String,
              match:
                HelloWorldTestingggg::PetSearchParams::TagFilter::Match::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Match
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::PetSearchParams::TagFilter::Match
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              HelloWorldTestingggg::PetSearchParams::TagFilter::Match::TaggedSymbol
            )
          PREFIX =
            T.let(
              :prefix,
              HelloWorldTestingggg::PetSearchParams::TagFilter::Match::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::PetSearchParams::TagFilter::Match::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
