module Shodanz
  # General client container class for all three
  # of Shodan's available API endpoints in a
  # convient place to use.
  #
  # @author Kent 'picat' Gruber
  class Client
    # @return [Shodanz::API::REST]
    attr_reader :rest_api
    # @return [Shodanz::API::Streaming]
    attr_reader :streaming_api
    # @return [Shodanz::API::Exploits]
    attr_reader :exploits_api

    # Create a new client to connect to any of the APIs.
    #
    # Optionally provide your shodan API key, or the environment
    # variable SHODAN_API_KEY will be used.
    def initialize(key: ENV['SHODAN_API_KEY'])
      # pass the given API key to each of the underlying clients
      #
      # Note: you can optionally change these API keys later, if you
      # had multiple for whatever reason. ;)
      #
      @rest_api      = Shodanz.api.rest.new(key: key)
      @streaming_api = Shodanz.api.streaming.new(key: key)
      @exploits_api  = Shodanz.api.exploits.new(key: key)
    end
  end
end
