# typed: strong

module HelloWorldTestingggg
  module Models
    class AIAIQueryResponse < HelloWorldTestingggg::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            HelloWorldTestingggg::Models::AIAIQueryResponse,
            HelloWorldTestingggg::Internal::AnyHash
          )
        end

      # Non-plural array on the response side
      sig do
        returns(
          T.nilable(
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted
            ]
          )
        )
      end
      attr_reader :data_extracted

      sig do
        params(
          data_extracted:
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted::OrHash
            ]
        ).void
      end
      attr_writer :data_extracted

      # Plural array on the response side
      sig do
        returns(
          T.nilable(
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule
            ]
          )
        )
      end
      attr_reader :matched_rules

      sig do
        params(
          matched_rules:
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule::OrHash
            ]
        ).void
      end
      attr_writer :matched_rules

      sig do
        params(
          data_extracted:
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted::OrHash
            ],
          matched_rules:
            T::Array[
              HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # Non-plural array on the response side
        data_extracted: nil,
        # Plural array on the response side
        matched_rules: nil
      )
      end

      sig do
        override.returns(
          {
            data_extracted:
              T::Array[
                HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted
              ],
            matched_rules:
              T::Array[
                HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule
              ]
          }
        )
      end
      def to_hash
      end

      class DataExtracted < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AIAIQueryResponse::DataExtracted,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :datapoint_value

        sig { params(datapoint_value: String).void }
        attr_writer :datapoint_value

        sig { params(datapoint_value: String).returns(T.attached_class) }
        def self.new(datapoint_value: nil)
        end

        sig { override.returns({ datapoint_value: String }) }
        def to_hash
        end
      end

      class MatchedRule < HelloWorldTestingggg::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              HelloWorldTestingggg::Models::AIAIQueryResponse::MatchedRule,
              HelloWorldTestingggg::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Float)) }
        attr_reader :match_score

        sig { params(match_score: Float).void }
        attr_writer :match_score

        sig { params(match_score: Float).returns(T.attached_class) }
        def self.new(match_score: nil)
        end

        sig { override.returns({ match_score: Float }) }
        def to_hash
        end
      end
    end
  end
end
