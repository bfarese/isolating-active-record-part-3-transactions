module Legitimation
  class ExtractLegitimator
    def self.for(attributes)
      new(attributes).extract
    end

    def extract
      new_legitimator_instance
    end

    private

    def initialize(attributes)
      @attributes = attributes
    end

    def new_legitimator_instance
      legitimator_constant.new(@attributes)
    end

    def legitimator_constant
      Object.const_get(legitimator_class_name)
    end

    def legitimator_class_name
      "Legitimation::#{legitimator_type.capitalize}Legitimator"
    end

    def legitimator_type
      legitimator_param.keys.first.to_s
    end

    def legitimator_param
      @attributes.last
    end
  end
end
