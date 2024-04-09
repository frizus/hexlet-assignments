# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(uri)
    @uri = URI(uri)
    parse_query()
  end

  def parse_query()
    if @uri.query.nil?
      @query = {}
      return
    end

    @query = @uri.query
        .split('&')
        .each_with_object({}) do |pair, acc|
      key, value = pair.split '='
      acc[key.to_sym] = value || nil
    end
  end

  def ==(other)
    scheme == other.scheme &&
      host == other.host &&
      port == other.port &&
      query_params == other.query_params
  end

  def query_params
    @query
  end

  def query_param(symbol, default = nil)
    if @query.key?(symbol)
      @query[symbol]
    else
      default
    end
  end
end
# END
