require_relative '../exceptions.rb'

module MonkeyBusiness
  # Base class for all Surveymonkey API resources
  class ApiResource
    attr_accessor :path

    def initialize(api, options = {}, path_prefix = nil)
      @api = api
      @id = options.delete(:id)
      @options = options

      resource_name = self.class.name
                                .gsub(/.+::/, '')
                                .gsub(/(.)([A-Z])/,'\1_\2')
                                .downcase

      @path = "#{path_prefix}/#{resource_name}"
      @path += "/#{@id}" if @id
    end

    def request
      @api.request(self.path, @options)
    end

    private

    def fail_without_id
      if @id.nil?
        raise MonkeyBusiness::ApiMethodError.new(
          <<~MESSAGE
            ID must be provided for the following method:
              #{caller_locations(1, 1)[0].label }
            Expected:
              #{@path}/:id
            Received:
              #{@path}
          MESSAGE
        )
      end
    end

  end
end