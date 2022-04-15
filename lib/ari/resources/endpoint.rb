#------------------------------------------------------------------------------
#
#  WARNING !
#
#  This is a generated file. DO NOT EDIT THIS FILE! Your changes will
#  be lost the next time this file is regenerated.
#
#  This file was generated using asterisk-ari-client ruby gem.
#
#------------------------------------------------------------------------------

module Ari
  class Endpoint < Resource

    attr_reader :technology, :resource, :state, :channel_ids


    # GET /endpoints
    #
    # Asterisk endpoints
    #
    #
    def self.list(options = {})
      path = '/endpoints'
      response = client(options).get(path, options)
      response.map { |hash| Endpoint.new(hash.merge(client: options[:client])) }
    end

    # PUT /endpoints/sendMessage
    #
    # Send a message to some technology URI or endpoint.
    #
    #
    # Parameters:
    #
    # to (required) - The endpoint resource or technology specific URI to send the message to. Valid resources are sip, pjsip, and xmpp.
    # from (required) - The endpoint resource or technology specific identity to send this message from. Valid resources are sip, pjsip, and xmpp.
    # body  - The body of the message
    # variables  - 
    #
    def self.send_message(options = {})
      raise ArgumentError.new("Parameter to must be passed in options hash.") unless options[:to]
      raise ArgumentError.new("Parameter from must be passed in options hash.") unless options[:from]
      path = '/endpoints/sendMessage'
      response = client(options).put(path, options)
      return response
    end
    class << self; alias_method :sendMessage, :send_message; end

    # GET /endpoints/%{tech}
    #
    # Asterisk endpoints
    #
    #
    # Parameters:
    #
    # tech (required) - Technology of the endpoints (sip,iax2,...)
    #
    def self.list_by_tech(options = {})
      raise ArgumentError.new("Parameter tech must be passed in options hash.") unless options[:tech]
      path = '/endpoints/%{tech}' % options
      response = client(options).get(path, options)
      response.map { |hash| Endpoint.new(hash.merge(client: options[:client])) }
    end
    class << self; alias_method :listByTech, :list_by_tech; end

    def list_by_tech(options = {})
      self.class.list_by_tech(options.merge(endpointId: self.id, client: @client))
    end

    # GET /endpoints/%{tech}/%{resource}
    #
    # Single endpoint
    #
    #
    # Parameters:
    #
    # tech (required) - Technology of the endpoint
    # resource (required) - ID of the endpoint
    #
    def self.get(options = {})
      raise ArgumentError.new("Parameter tech must be passed in options hash.") unless options[:tech]
      raise ArgumentError.new("Parameter resource must be passed in options hash.") unless options[:resource]
      path = '/endpoints/%{tech}/%{resource}' % options
      response = client(options).get(path, options)
      Endpoint.new(response.merge(client: options[:client]))
    end

    def get(options = {})
      self.class.get(options.merge(endpointId: self.id, client: @client))
    end

    # PUT /endpoints/%{tech}/%{resource}/sendMessage
    #
    # Send a message to some endpoint in a technology.
    #
    #
    # Parameters:
    #
    # tech (required) - Technology of the endpoint
    # resource (required) - ID of the endpoint
    # from (required) - The endpoint resource or technology specific identity to send this message from. Valid resources are sip, pjsip, and xmpp.
    # body  - The body of the message
    # variables  - 
    #
    def self.send_message_to_endpoint(options = {})
      raise ArgumentError.new("Parameter tech must be passed in options hash.") unless options[:tech]
      raise ArgumentError.new("Parameter resource must be passed in options hash.") unless options[:resource]
      raise ArgumentError.new("Parameter from must be passed in options hash.") unless options[:from]
      path = '/endpoints/%{tech}/%{resource}/sendMessage' % options
      response = client(options).put(path, options)
      return response
    end
    class << self; alias_method :sendMessageToEndpoint, :send_message_to_endpoint; end

    def send_message_to_endpoint(options = {})
      self.class.send_message_to_endpoint(options.merge(endpointId: self.id, client: @client))
    end


  end
end

Ari::Client.send :define_method, 'endpoints' do
  Ari::ListResource.new(self, Ari::Endpoint)
end
