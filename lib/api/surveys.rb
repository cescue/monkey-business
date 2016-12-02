require_relative 'api_resource.rb'

module MonkeyBusiness
  class Surveys < ApiResource
    def details
      @path += '/details'
    end
  end
end