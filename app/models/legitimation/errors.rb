module Legitimation
  class Errors
    def initialize(error=Legitimation::Error)
      @errors = []
      @error = error
    end

    def add(attribute, message)
      @errors.push(@error.new(attribute, message))
    end

    def full_messages
      @errors.map { |error| error.full_message }
    end

    def size
      @errors.size
    end
  end
end
