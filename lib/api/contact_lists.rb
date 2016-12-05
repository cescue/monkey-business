# frozen_string_literal: true

require_relative 'api_resource.rb'
require_relative 'contacts.rb'

module MonkeyBusiness
  # Abstraction of the Surveymonkey contact_list resource and associated methods
  class ContactLists < ApiResource
    def copy(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/copy'
      self
    end

    def merge(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/merge'
      self
    end

    def contacts(options = {})
      fail_without_id
      Contacts.new(@api, @options.merge(options), @path)
    end
  end
end
