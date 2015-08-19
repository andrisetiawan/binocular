require "net/https"
require "uri"
require "binocular/version"

module Binocular
  class Bin
    attr_accessor :settings, :bin_number

    def self.info bin_number
      default_settings = { proxy_host: nil, proxy_port: nil }
      self.new(default_settings).info bin_number
    end

    def initialize(settings)
      self.settings = settings
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

    def info(bin_number)
      uri = URI.parse("http://www.binlist.net/json/#{bin_number}")

      http = Net::HTTP.new(uri.host, uri.port, self.proxy_host, self.proxy_port)
      http.use_ssl      = false
      http.open_timeout = self.timeout
      http.read_timeout = self.timeout

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      puts response.body
    end

  end
end
