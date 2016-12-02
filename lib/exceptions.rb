# frozen_string_literal: true
#
module MonkeyBusiness
  # Raise this error for malformed API requests
  class ApiMethodError < ArgumentError; end

  # Raise this error for unsupported HTTP methods
  class HttpMethodError < ArgumentError
    def initialize(method_name)
      super("Unsupported HTTP method: #{method_name}")
    end
  end
end
