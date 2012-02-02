module Oldskool
  class IpinfodbHandler
    def initialize(params, keyword, config)
      require 'geo_ip'
      require 'ipaddr'

      @params = params
      @keyword = keyword
      @config = config
      self
    end

    def plugin_template(template)
      File.read(File.expand_path("../../../views/#{template}.erb", __FILE__))
    end

    def handle_request(keyword, query)
      raise "Please set :ipinfodb_apikey in the config" unless @config[:ipinfodb_apikey]

      (query == "") ? ip = @params[:http_request].ip : ip = query

      ipaddr = IPAddr.new(ip)
      return({:template => :error, :error => "Invalid IP #{ip}, only IPv4 addresses are supported"}) unless ipaddr.ipv4?

      GeoIp.api_key = @config[:ipinfodb_apikey]
      geoip = GeoIp.geolocation(ip)

      {:template => plugin_template(:ipinfo), :ipinfo => geoip}
    end
  end
end
