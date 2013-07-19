require 'flika'
require "flika/version"
require 'flika/client'
require 'flika/photo'
require 'forwardable'

module Flika
  extend Forwardable
  # Your code goes here...
  API_KEY = ENV['FLICKR_API_KEY'] || "859a2f2e154d3ad1c9732c768c7cd01f"
  BASE_URL = "http://api.flickr.com/services/rest"
  attr_accessor :client
  def_delegator :options, :hash

  class << self
    def client
      @client ||= Client.new 
    end
    def client?
      !!@client
    end

    def search(tags)
      objects_from_response(Photo, 'get', {method: 'flickr.photos.search', tags: tags}, :photos)
    end
    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    private
    def objects_from_response(klass, request_method, params, key)
      response = client.send(request_method.to_sym, params)[:body][key][key.to_s.chop.to_sym]
      objects_from_array(klass, response)
    end
    def objects_from_array(klass, array)
      array.map do |element|
        klass.new(element)
      end
    end


    def method_missing(method_name, *args, &block)
      return super unless respond_to_missing?(method_name)
      client.send(method_name, *args, &block)
    end

  end
end

