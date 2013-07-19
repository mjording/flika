require 'faraday'
require 'json'
require 'flika/error/parser_error'
require 'flika/response/parse_json'

module Flika
  class Client
    attr_accessor :connection_options, :middleware, :connection, :options
    def initialize
      @middleware = Faraday::Builder.new(&Proc.new { |builder|
       builder.use Faraday::Request::UrlEncoded
       builder.use Flika::Response::ParseJson
       builder.adapter Faraday.default_adapter
      })
      @connection_options = {headers: {accept: 'application/json'}}
      @options = {api_key: "#{Flika::API_KEY}", format: 'json', nojsoncallback: '1'}
    end

    def connection
      @connection ||= Faraday.new(Flika::BASE_URL, connection_options.merge(:builder => @middleware))
    end



    def get(params={})
      connection.get{ |req| req.params = params.merge(options)}.env
    rescue Faraday::Error::ClientError
      raise Flika::Error::ClientError
    rescue JSON::ParserError
      raise Flika::Error::ParserError
    end



  end
end
