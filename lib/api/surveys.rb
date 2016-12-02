# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'responses.rb'
require_relative 'collectors.rb'
require_relative 'pages.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey survey resource and associated methods
  class Surveys < ApiResource
    def details(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/details'
      self
    end

    def responses(options = {})
      fail_without_id
      Responses.new(@api, @options.merge(options), @path)
    end

    def collectors(options = {})
      fail_without_id
      Collectors.new(@api, @options.merge(options), @path)
    end

    def pages(options = {})
      fail_without_id
      Pages.new(@api, @options.merge(options), @path)
    end
  end
end
