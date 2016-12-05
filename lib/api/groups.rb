# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'members.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey group resource and associated methods
  class Groups < ApiResource
    def members(options = {})
      fail_without_id
      Members.new(@api, @options.merge(options), @path)
    end
  end
end
