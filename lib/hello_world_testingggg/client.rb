# frozen_string_literal: true

module HelloWorldTestingggg
  class Client < HelloWorldTestingggg::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # The API key for authorization in the header.
    # @return [String]
    attr_reader :api_key

    # Username for HTTP Basic authentication.
    # @return [String]
    attr_reader :basic_auth_username

    # Password for HTTP Basic authentication.
    # @return [String]
    attr_reader :basic_auth_password

    # Secret used to verify incoming webhook signatures.
    # @return [String, nil]
    attr_reader :webhook_secret

    # Everything about your Pets
    # @return [HelloWorldTestingggg::Resources::Pet]
    attr_reader :pet

    # File storage operations
    # @return [HelloWorldTestingggg::Resources::Files]
    attr_reader :files

    # Pet owner profile and compliance operations
    # @return [HelloWorldTestingggg::Resources::Profiles]
    attr_reader :profiles

    # Adoption policies and applications
    # @return [HelloWorldTestingggg::Resources::Adoptions]
    attr_reader :adoptions

    # Post-adoption placement tracking
    # @return [HelloWorldTestingggg::Resources::Placements]
    attr_reader :placements

    # @return [HelloWorldTestingggg::Resources::Veterinary]
    attr_reader :veterinary

    # @return [HelloWorldTestingggg::Resources::Webhooks]
    attr_reader :webhooks

    # @return [HelloWorldTestingggg::Resources::Notifications]
    attr_reader :notifications

    # Access to Petstore orders
    # @return [HelloWorldTestingggg::Resources::Store]
    attr_reader :store

    # Operations about user
    # @return [HelloWorldTestingggg::Resources::User]
    attr_reader :user

    # @return [HelloWorldTestingggg::Resources::AI]
    attr_reader :ai

    # @return [HelloWorldTestingggg::Resources::Media]
    attr_reader :media

    # Returns the current API health, including per-service statuses.
    #
    # @overload health(request_options: {})
    #
    # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
    #
    # @return [HelloWorldTestingggg::Models::SystemHealth]
    #
    # @see HelloWorldTestingggg::Models::ClientHealthParams
    def health(params = {})
      request(
        method: :get,
        path: "health",
        model: HelloWorldTestingggg::SystemHealth,
        options: params[:request_options]
      )
    end

    # Returns the caller's current rate-limit budget.
    #
    # @overload retrieve_rate_limits(request_options: {})
    #
    # @param request_options [HelloWorldTestingggg::RequestOptions, Hash{Symbol=>Object}, nil]
    #
    # @return [HelloWorldTestingggg::Models::RetrieveRateLimitsResponse]
    #
    # @see HelloWorldTestingggg::Models::ClientRetrieveRateLimitsParams
    def retrieve_rate_limits(params = {})
      request(
        method: :get,
        path: "rate_limits",
        model: HelloWorldTestingggg::Models::RetrieveRateLimitsResponse,
        options: params[:request_options]
      )
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {**auth_api_key, **basic_auth}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_api_key
      {"api_key" => @api_key}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def basic_auth
      return {} if @basic_auth_username.nil? || @basic_auth_password.nil?

      base64_credentials = ["#{@basic_auth_username}:#{@basic_auth_password}"].pack("m0")
      {"authorization" => "Basic #{base64_credentials}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] The API key for authorization in the header. Defaults to `ENV["API_KEY"]`
    #
    # @param basic_auth_username [String, nil] Username for HTTP Basic authentication. Defaults to `ENV["BASIC_AUTH_USERNAME"]`
    #
    # @param basic_auth_password [String, nil] Password for HTTP Basic authentication. Defaults to `ENV["BASIC_AUTH_PASSWORD"]`
    #
    # @param webhook_secret [String, nil] Secret used to verify incoming webhook signatures. Defaults to
    # `ENV["PETSTORE_WEBHOOK_SECRET"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to
    # `ENV["HELLO_WORLD_TESTINGGGG_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["API_KEY"],
      basic_auth_username: ENV["BASIC_AUTH_USERNAME"],
      basic_auth_password: ENV["BASIC_AUTH_PASSWORD"],
      webhook_secret: ENV["PETSTORE_WEBHOOK_SECRET"],
      base_url: ENV["HELLO_WORLD_TESTINGGGG_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "/api/v3"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"API_KEY\"")
      end
      if basic_auth_username.nil?
        raise ArgumentError.new("basic_auth_username is required, and can be set via environ: \"BASIC_AUTH_USERNAME\"")
      end
      if basic_auth_password.nil?
        raise ArgumentError.new("basic_auth_password is required, and can be set via environ: \"BASIC_AUTH_PASSWORD\"")
      end

      headers = {}
      custom_headers_env = ENV["HELLO_WORLD_TESTINGGGG_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s
      @basic_auth_username = basic_auth_username.to_s
      @basic_auth_password = basic_auth_password.to_s
      @webhook_secret = webhook_secret&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @pet = HelloWorldTestingggg::Resources::Pet.new(client: self)
      @files = HelloWorldTestingggg::Resources::Files.new(client: self)
      @profiles = HelloWorldTestingggg::Resources::Profiles.new(client: self)
      @adoptions = HelloWorldTestingggg::Resources::Adoptions.new(client: self)
      @placements = HelloWorldTestingggg::Resources::Placements.new(client: self)
      @veterinary = HelloWorldTestingggg::Resources::Veterinary.new(client: self)
      @webhooks = HelloWorldTestingggg::Resources::Webhooks.new(client: self)
      @notifications = HelloWorldTestingggg::Resources::Notifications.new(client: self)
      @store = HelloWorldTestingggg::Resources::Store.new(client: self)
      @user = HelloWorldTestingggg::Resources::User.new(client: self)
      @ai = HelloWorldTestingggg::Resources::AI.new(client: self)
      @media = HelloWorldTestingggg::Resources::Media.new(client: self)
    end
  end
end
