# frozen_string_literal: true

require_relative 'api_resource.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey question resource  and associated methods
  class Questions < ApiResource
    def benchmark(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/benchmark'
      self
    end
  end
end
