class Users::User
  attr_reader :id
  attr_accessor :name, :email

  def initialize(args={})
    @id = args.fetch(:id){ nil }
    @name = args.fetch(:name){ nil }
    @email = args.fetch(:email){ nil }
  end
end
