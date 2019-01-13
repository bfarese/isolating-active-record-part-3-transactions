module Legitimation
  class Error
    attr_reader :attribute, :message

    def initialize(attribute, message)
      @attribute = attribute
      @message = message
    end

    def full_message
      "#{attribute.capitalize} #{message}"
    end 
  end
end
