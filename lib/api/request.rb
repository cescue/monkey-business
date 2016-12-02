# frozen_string_literal: true

require 'json'
require 'net/http'

require_relative '../exceptions.rb'

module MonkeyBusiness
  # Abstraction of an HTTP request sent to the surveymonkey API
  class HttpRequest
    def self.request(access_token, uri, options = {})
      @uri = URI(uri)

      @http_method = options[:method] ? options.delete(:method).to_sym : :get
      @options = options

      raise HttpMethodError.new(@http_method) unless respond_to?(@http_method)

      request = send(@http_method)

      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true

      request['Authorization'] = "bearer #{access_token}"
      request['Content-Type'] = 'application/json'

      response = @http.request(request)

      if [:get, :post].include?(@http_method)
        JSON.parse(response.body)
      elsif @http_method == :options
        response['Allow'].split(',').map { |x| x.downcase.to_sym  }
      elsif @http_method == :head
        response.to_hash
      end
    end

    def self.get
      params = @options.map { |k, v| "#{k}=#{v}" }.join('&')
      Net::HTTP::Get.new("#{@uri.request_uri}?#{params}")
    end

    def self.post(options = {})
      raise NotImplementedError.new
    end

    def self.head(options = {})
      Net::HTTP::Head.new(@uri.request_uri)
    end

    def self.options(options = {})
      Net::HTTP::Options.new(@uri.request_uri)
    end
  end
end
