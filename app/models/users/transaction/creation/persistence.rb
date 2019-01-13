class Users::Transaction::Creation::Persistence
  def self.call(args)
    new(args).call
  end

  def call
    response
  end

  private

  def initialize(args, repo: Users::Repository.new, user: Users::User)
    @true_or_false = args.fetch(:true_or_false)
    @params = args.fetch(:params)
    @repo = repo
    @user = user
  end

  def response
    self.send(response_method)
  end

  def response_method
    "persist_#{@true_or_false.to_s}"
  end

  def persist_true
    create_user
  end

  def create_user
    @repo.create(@params)
  end

  def persist_false
    new_user_instance
  end

  def new_user_instance
    @user.new(@params)
  end
end
