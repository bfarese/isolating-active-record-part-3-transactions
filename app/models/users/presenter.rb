module Users
  class Presenter
    def initialize(name)
      @name = name
    end

    def name
      @name.capitalize
    end
  end
end
