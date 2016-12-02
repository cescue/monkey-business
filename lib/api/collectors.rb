# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'responses.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey collectors resource and associated methods
  class Collectors < ApiResource
    def responses(options = {})
      Responses.new(@api, @options.merge(options), @path)
    end
  end
end
