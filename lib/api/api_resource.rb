module MonkeyBusiness
  # Base class for all Surveymonkey API resources
  class ApiResource
    attr_accessor :path

    def initialize(api, options = {}, path_prefix = nil)
      @id = options.delete(:id)

      resource_name = self.class.name
                      .gsub(/.+::/, '')
                      .gsub(/(.)([A-Z])/,'\1_\2')
                      .downcase

      @path = "#{path_prefix}/#{resource_name}"
      @path += "/#{@id}" if @id
    end
  end
end