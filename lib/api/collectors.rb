# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'responses.rb'
require_relative 'messages.rb'
require_relative 'recipients.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey collectors resource and associated methods
  class Collectors < ApiResource
    def responses(options = {})
      fail_without_id
      Responses.new(@api, @options.merge(options), @path)
    end

    def messages(options = {})
      fail_without_id
      Messages.new(@api, @options.merge(options), @path)
    end

    def recipients(options = {})
      fail_without_id
      Recipients.new(@api, @options.merge(options), @path)
    end
  end
end
