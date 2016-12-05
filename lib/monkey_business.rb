# frozen_string_literal: true

require_relative 'api/request.rb'
require_relative 'api/surveys.rb'
require_relative 'api/survey_categories.rb'
require_relative 'api/survey_templates.rb'
require_relative 'api/users.rb'
require_relative 'api/groups.rb'
require_relative 'api/contact_lists.rb'
require_relative 'api/contacts.rb'
require_relative 'api/contact_fields.rb'

module MonkeyBusiness
  API_VERSION = 'v3'
  BASE_URI = "https://api.surveymonkey.net/#{API_VERSION}"

  # This is the class the end-user should be interacting with.
  class API
    def initialize
      @access_token = ENV['SURVEYMONKEY_ACCESS_TOKEN']
    end

    def surveys(options = {})
      Surveys.new(self, options)
    end

    def survey_categories(options = {})
      SurveyCategories.new(self, options)
    end

    def survey_templates(options = {})
      SurveyTemplates.new(self, options)
    end

    def users(options = {})
      Users.new(self, options)
    end

    def groups(options = {})
      Groups.new(self, options)
    end

    def contact_lists(options = {})
      ContactLists.new(self, options)
    end

    def contacts(options = {})
      Contacts.new(self, options)
    end

    def contact_fields(options = {})
      ContactFields.new(self, options)
    end

    def request(resource_path, options = {})
      HttpRequest.request(
        @access_token,
        BASE_URI + resource_path,
        options
      )
    end
  end
end
