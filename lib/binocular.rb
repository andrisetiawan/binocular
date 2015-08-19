require "net/https"
require "uri"
require "json"
require "binocular/version"

module Binocular
  class Bin
    attr_accessor :settings, :bin_number
    attr_reader :info
    DEFAULT_SETTINGS = { proxy_host: nil, proxy_port: nil }

    def self.info bin_number
      self.new(bin_number).fetch_info
    end

    def initialize(bin_number, settings=DEFAULT_SETTINGS)
      self.settings = settings
      self.bin_number = bin_number
    end

    def proxy_host
      self.settings[:proxy_host] ? self.settings[:proxy_host] : nil
    end

    def proxy_port
      self.settings[:proxy_port] ? self.settings[:proxy_port] : nil
    end

    def timeout
      self.settings[:timeout] ? self.settings[:timeout] : 20
    end

    def fetch_info
      uri = URI.parse("http://www.binlist.net/json/#{self.bin_number}")

      http = Net::HTTP.new(uri.host, uri.port, self.proxy_host, self.proxy_port)
      http.use_ssl      = false
      http.open_timeout = self.timeout
      http.read_timeout = self.timeout

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      @info = JSON.parse response.body
    end

  end
end
