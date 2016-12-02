# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'questions.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey page resource and associated methods
  class Pages < ApiResource
    def questions(options = {})
      fail_without_id
      Questions.new(@api, @options.merge(options), @path)
    end
  end
end
