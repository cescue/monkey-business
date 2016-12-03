# frozen_string_literal: true

require 'json'
require 'net/http'

require_relative '../exceptions.rb'

module MonkeyBusiness
  # Abstraction of an HTTP request sent to the surveymonkey API
  class HttpRequest
    def self.request(access_token, uri, options = {})
      @access_token = access_token
      @uri = URI(uri)

      @http_method = options[:method] ? options.delete(:method).to_sym : :get
      @options = options

      raise HttpMethodError, @http_method unless respond_to?(@http_method)

      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true

      send(@http_method)
    end

    def self.get
      params = @options.map { |k, v| "#{k}=#{v}" }.join('&')

      request = Net::HTTP::Get.new("#{@uri.request_uri}?#{params}")
      request['Authorization'] = "bearer #{@access_token}"
      request['Content-Type'] = 'application/json'

      response = @http.request(request)

      JSON.parse(response.body)
    end

    def self.post
      raise NotImplementedError, 'Not Yet Implemented'
    end

    def self.head
      request = Net::HTTP::Head.new(@uri.request_uri)
      request['Authorization'] = "bearer #{@access_token}"
      request['Content-Type'] = 'application/json'

      @http.request(request).to_hash
    end

    def self.options
      request = Net::HTTP::Options.new(@uri.request_uri)

      request['Authorization'] = "bearer #{@access_token}"
      request['Content-Type'] = 'application/json'

      response = @http.request(request)

      response['Allow'].split(',').map { |x| x.downcase.to_sym }
    end
  end
end
