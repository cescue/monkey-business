require_relative 'api_resource.rb'
require_relative 'responses.rb'

module MonkeyBusiness
  class Collectors < ApiResource
    def responses(options = {})
      Responses.new(@api, @options.merge(options), @path)
    end
  end
end