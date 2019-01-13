class Users::Transaction::Create
  def self.call(params)
    new(params).call
  end

  def call
    step_1
    step_2
    step_3
    response
  end

  private

  def initialize(params)
    @params = params
  end

  def step_1
    legitimize
  end

  def legitimize
    @true_or_false = legitimate.success?
  end

  def legitimate
    @legitimate ||= Users::Legitimate.new(@params)
  end

  def step_2
    persist
  end

  def persist
    @user = Users::Transaction::Creation::Persistence.call(persist_params)
  end

  def persist_params
    { params: @params, true_or_false: @true_or_false }
  end

  def step_3
    message
  end

  def message
    @message = Users::Transaction::Creation::Message.call(@true_or_false)
  end

  def response
    UserCreationResponse.new({
      true_or_false: @true_or_false,
      user: @user,
      message: @message,
      errors: legitimate.errors})
  end

  class UserCreationResponse
    attr_reader :user, :message, :errors

    def initialize(args)
      @true_or_false = args.fetch(:true_or_false)
      @user = args.fetch(:user)
      @message = args.fetch(:message)
      @errors = args.fetch(:errors)
    end

    def legitimate?
      @true_or_false
    end
  end
end
