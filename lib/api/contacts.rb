# frozen_string_literal: true

require_relative 'api_resource.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey contact resource and associated methods
  class Contacts < ApiResource
    def bulk(options = {})
      @options.merge!(options)
      @path += '/bulk'
      self
    end
  end
end
