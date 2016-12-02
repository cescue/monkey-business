require_relative 'api_resource.rb'

module MonkeyBusiness
  class Responses < ApiResource
    def bulk(options)
      @options.merge!(options)
      @path += '/bulk'
      self
    end
  end
end