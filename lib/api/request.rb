require 'json'
require 'net/http'

require_relative '../exceptions.rb'

module MonkeyBusiness
  # Abstraction of an HTTP request sent to the surveymonkey API
  class HttpRequest

    def self.request(access_token, uri, options = {})
      @uri = URI(uri)
      @http_method = (options[:method] || :get).to_sym

      if respond_to?(@http_method)
        request = send(@http_method)
      else
        raise HttpMethodError.new("Unsupported HTTP method: #{@http_method}")
      end

      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true

      request['Authorization'] = "bearer #{access_token}"
      request['Content-Type'] = 'application/json'

      puts uri
      response = @http.request(request)

      JSON.parse(response.body)
    end

    def self.get(options = {})
      params = options.map { |k, v| "#{k}=#{v}" }.join('&')
      Net::HTTP::Get.new("#{@uri.request_uri}?#{params}")
    end

    def self.post(options = {})
      raise NotImplementedError.new
    end

    def self.head(options = {})
      raise NotImplementedError.new
    end

    def self.options(options = {})
      raise NotImplementedError.new
    end
  end
end