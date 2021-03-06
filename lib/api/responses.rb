# frozen_string_literal: true

require_relative 'api_resource.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey responses resource  and associated methods
  class Responses < ApiResource
    def details(options = {})
      @options.merge!(options)
      @path += '/details'
      self
    end

    def bulk(options = {})
      @options.merge!(options)
      @path += '/bulk'
      self
    end
  end
end
