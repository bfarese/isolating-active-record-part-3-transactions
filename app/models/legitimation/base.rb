module Legitimation
  class Base
    attr_reader :errors

    @@legitimators = []

    def initialize(errors: Legitimation::Errors.new)
      @errors = errors
    end

    def self.legitimators
      @@legitimators
    end

    def self.legitimizes(*attributes)
      self.raise_argument_error if attributes.empty?

      legitimator = self.build_legitimator!(attributes)
      @@legitimators.push(legitimator)
    end

    def success?
      legitimize!
      errors_exist?
    end

    private

    def self.raise_argument_error
      raise ArgumentError, "You need to supply at least one attribute"
    end

    def self.build_legitimator!(attributes)
      Legitimation::Legitimator::Build.with(attributes)
      # Legitimation::ExtractLegitimator.for(attributes)
    end

    def legitimize!
      self.class.legitimators.each do |legitimator|
        legitimator.call(self)
      end
    end

    def errors_exist?
      errors.size == 0 ? true : false
    end
  end
end
