# typed: strong

module HelloWorldTestingggg
  class Client < HelloWorldTestingggg::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # The API key for authorization in the header.
    sig { returns(String) }
    attr_reader :api_key

    # Username for HTTP Basic authentication.
    sig { returns(String) }
    attr_reader :basic_auth_username

    # Password for HTTP Basic authentication.
    sig { returns(String) }
    attr_reader :basic_auth_password

    # Secret used to verify incoming webhook signatures.
    sig { returns(T.nilable(String)) }
    attr_reader :webhook_secret

    # Everything about your Pets
    sig { returns(HelloWorldTestingggg::Resources::Pet) }
    attr_reader :pet

    # File storage operations
    sig { returns(HelloWorldTestingggg::Resources::Files) }
    attr_reader :files

    # Pet owner profile and compliance operations
    sig { returns(HelloWorldTestingggg::Resources::Profiles) }
    attr_reader :profiles

    # Adoption policies and applications
    sig { returns(HelloWorldTestingggg::Resources::Adoptions) }
    attr_reader :adoptions

    # Post-adoption placement tracking
    sig { returns(HelloWorldTestingggg::Resources::Placements) }
    attr_reader :placements

    sig { returns(HelloWorldTestingggg::Resources::Veterinary) }
    attr_reader :veterinary

    sig { returns(HelloWorldTestingggg::Resources::Webhooks) }
    attr_reader :webhooks

    sig { returns(HelloWorldTestingggg::Resources::Notifications) }
    attr_reader :notifications

    # Access to Petstore orders
    sig { returns(HelloWorldTestingggg::Resources::Store) }
    attr_reader :store

    # Operations about user
    sig { returns(HelloWorldTestingggg::Resources::User) }
    attr_reader :user

    sig { returns(HelloWorldTestingggg::Resources::AI) }
    attr_reader :ai

    sig { returns(HelloWorldTestingggg::Resources::Media) }
    attr_reader :media

    # Returns the current API health, including per-service statuses.
    sig do
      params(
        request_options: HelloWorldTestingggg::RequestOptions::OrHash
      ).returns(HelloWorldTestingggg::SystemHealth)
    end
    def health(request_options: {})
    end

    # Returns the caller's current rate-limit budget.
    sig do
      params(
        request_options: HelloWorldTestingggg::RequestOptions::OrHash
      ).returns(HelloWorldTestingggg::Models::RetrieveRateLimitsResponse)
    end
    def retrieve_rate_limits(request_options: {})
    end

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def auth_api_key
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def basic_auth
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        basic_auth_username: T.nilable(String),
        basic_auth_password: T.nilable(String),
        webhook_secret: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # The API key for authorization in the header. Defaults to `ENV["API_KEY"]`
      api_key: ENV["API_KEY"],
      # Username for HTTP Basic authentication. Defaults to `ENV["BASIC_AUTH_USERNAME"]`
      basic_auth_username: ENV["BASIC_AUTH_USERNAME"],
      # Password for HTTP Basic authentication. Defaults to `ENV["BASIC_AUTH_PASSWORD"]`
      basic_auth_password: ENV["BASIC_AUTH_PASSWORD"],
      # Secret used to verify incoming webhook signatures. Defaults to
      # `ENV["PETSTORE_WEBHOOK_SECRET"]`
      webhook_secret: ENV["PETSTORE_WEBHOOK_SECRET"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to
      # `ENV["HELLO_WORLD_TESTINGGGG_BASE_URL"]`
      base_url: ENV["HELLO_WORLD_TESTINGGGG_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: HelloWorldTestingggg::Client::DEFAULT_MAX_RETRIES,
      timeout: HelloWorldTestingggg::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: HelloWorldTestingggg::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: HelloWorldTestingggg::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
