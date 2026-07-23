# typed: strong

module HelloWorldTestingggg
  module Models
    class AIAIQueryParams < HelloWorldTestingggg::Internal::Type::BaseModel
      extend HelloWorldTestingggg::Internal::Type::RequestParameters::Converter
      include HelloWorldTestingggg::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::AIAIQueryParams,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Non-plural array property: singularization is a no-op (decisive probe)
      sig do
        returns(T::Array[HelloWorldTestingggg::AIAIQueryParams::DataToExtract])
      end
      attr_accessor :data_to_extract

      # The domain name to analyze
      sig { returns(String) }
      attr_accessor :domain

      # Digit-seam acronym parent for nested element mints
      sig do
        returns(
          T.nilable(HelloWorldTestingggg::AIAIQueryParams::Authentication3DS)
        )
      end
      attr_reader :authentication_3ds

      sig do
        params(
          authentication_3ds:
            HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::OrHash
        ).void
      end
      attr_writer :authentication_3ds

      # Non-plural map property with enum values (map-mint probe)
      sig do
        returns(
          T.nilable(
            T::Hash[
              Symbol,
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::OrSymbol
            ]
          )
        )
      end
      attr_reader :datapoint_object_schema

      sig do
        params(
          datapoint_object_schema:
            T::Hash[
              Symbol,
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::OrSymbol
            ]
        ).void
      end
      attr_writer :datapoint_object_schema

      # Plural array property: singularized element mint (control probe)
      sig do
        returns(
          T.nilable(
            T::Array[HelloWorldTestingggg::AIAIQueryParams::ExtractionRule]
          )
        )
      end
      attr_reader :extraction_rules

      sig do
        params(
          extraction_rules:
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::OrHash
            ]
        ).void
      end
      attr_writer :extraction_rules

      sig do
        params(
          data_to_extract:
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::OrHash
            ],
          domain: String,
          authentication_3ds:
            HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::OrHash,
          datapoint_object_schema:
            T::Hash[
              Symbol,
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::OrSymbol
            ],
          extraction_rules:
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::OrHash
            ],
          request_options: HelloWorldTestingggg::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Non-plural array property: singularization is a no-op (decisive probe)
        data_to_extract:,
        # The domain name to analyze
        domain:,
        # Digit-seam acronym parent for nested element mints
        authentication_3ds: nil,
        # Non-plural map property with enum values (map-mint probe)
        datapoint_object_schema: nil,
        # Plural array property: singularized element mint (control probe)
        extraction_rules: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            data_to_extract:
              T::Array[HelloWorldTestingggg::AIAIQueryParams::DataToExtract],
            domain: String,
            authentication_3ds:
              HelloWorldTestingggg::AIAIQueryParams::Authentication3DS,
            datapoint_object_schema:
              T::Hash[
                Symbol,
                HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::OrSymbol
              ],
            extraction_rules:
              T::Array[HelloWorldTestingggg::AIAIQueryParams::ExtractionRule],
            request_options: HelloWorldTestingggg::RequestOptions
          }
        )
      end
      def to_hash
      end

      class DataToExtract < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :datapoint_name

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::OrSymbol
            )
          )
        end
        attr_reader :datapoint_type

        sig do
          params(
            datapoint_type:
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::OrSymbol
          ).void
        end
        attr_writer :datapoint_type

        sig do
          params(
            datapoint_name: String,
            datapoint_type:
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(datapoint_name:, datapoint_type: nil)
        end

        sig do
          override.returns(
            {
              datapoint_name: String,
              datapoint_type:
                HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::OrSymbol
            }
          )
        end
        def to_hash
        end

        module DatapointType
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::TaggedSymbol
            )
          NUMBER =
            T.let(
              :number,
              HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::DataToExtract::DatapointType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Authentication3DS < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::AIAIQueryParams::Authentication3DS,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        # Plural array under the 3DS seam
        sig do
          returns(
            T.nilable(
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule
              ]
            )
          )
        end
        attr_reader :challenge_rules

        sig do
          params(
            challenge_rules:
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule::OrHash
              ]
          ).void
        end
        attr_writer :challenge_rules

        # Non-plural array under the 3DS seam
        sig do
          returns(
            T.nilable(
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck
              ]
            )
          )
        end
        attr_reader :fallback_check

        sig do
          params(
            fallback_check:
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck::OrHash
              ]
          ).void
        end
        attr_writer :fallback_check

        # Digit-seam acronym parent for nested element mints
        sig do
          params(
            challenge_rules:
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule::OrHash
              ],
            fallback_check:
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Plural array under the 3DS seam
          challenge_rules: nil,
          # Non-plural array under the 3DS seam
          fallback_check: nil
        )
        end

        sig do
          override.returns(
            {
              challenge_rules:
                T::Array[
                  HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule
                ],
              fallback_check:
                T::Array[
                  HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck
                ]
            }
          )
        end
        def to_hash
        end

        class ChallengeRule < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::ChallengeRule,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :challenge_kind

          sig { params(challenge_kind: String).void }
          attr_writer :challenge_kind

          sig { params(challenge_kind: String).returns(T.attached_class) }
          def self.new(challenge_kind: nil)
          end

          sig { override.returns({ challenge_kind: String }) }
          def to_hash
          end
        end

        class FallbackCheck < HelloWorldTestingggg::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                HelloWorldTestingggg::AIAIQueryParams::Authentication3DS::FallbackCheck,
                HelloWorldTestingggg::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :check_name

          sig { params(check_name: String).void }
          attr_writer :check_name

          sig { params(check_name: String).returns(T.attached_class) }
          def self.new(check_name: nil)
          end

          sig { override.returns({ check_name: String }) }
          def to_hash
          end
        end
      end

      module DatapointObjectSchema
        extend HelloWorldTestingggg::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STRING =
          T.let(
            :string,
            HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::TaggedSymbol
          )
        NUMBER =
          T.let(
            :number,
            HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::TaggedSymbol
          )
        BOOLEAN =
          T.let(
            :boolean,
            HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              HelloWorldTestingggg::AIAIQueryParams::DatapointObjectSchema::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class ExtractionRule < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :rule_name

        sig { params(rule_name: String).void }
        attr_writer :rule_name

        sig do
          returns(
            T.nilable(
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::OrSymbol
            )
          )
        end
        attr_reader :rule_severity

        sig do
          params(
            rule_severity:
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::OrSymbol
          ).void
        end
        attr_writer :rule_severity

        sig do
          params(
            rule_name: String,
            rule_severity:
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(rule_name: nil, rule_severity: nil)
        end

        sig do
          override.returns(
            {
              rule_name: String,
              rule_severity:
                HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::OrSymbol
            }
          )
        end
        def to_hash
        end

        module RuleSeverity
          extend HelloWorldTestingggg::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                HelloWorldTestingggg::AIAIQueryParams::ExtractionRule::RuleSeverity::TaggedSymbol
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
