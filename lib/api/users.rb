# frozen_string_literal: true

require_relative 'api_resource.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey users resource  and associated methods
  class Users < ApiResource
    def me(options = {})
      @options.merge!(options)
      @path += '/me'
      self
    end
  end
end
