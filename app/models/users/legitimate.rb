module Users
  class Legitimate < Legitimation::Base
    attr_reader :name, :email

    def initialize(args)
      super()
      @name = args.fetch(:name)
      @email = args.fetch(:email)
    end

    legitimizes :name, :email, presence: true
  end
end
