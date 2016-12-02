module MonkeyBusiness
  class HttpMethodError < ArgumentError; end

  class NotImplementedError < StandardError
    def initialize(msg = 'Method not yet implemented')
      super
    end
  end
end