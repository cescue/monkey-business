# frozen_string_literal: true

module MonkeyBusiness
  # Abstraction of the Surveymonkey benchmark_bundle resource
  # and associated methods
  class BenchmarkBundles < ApiResource
    def analyze(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/details'
    end
  end
end
