class Users::Transaction::Creation::Message
  def self.call(true_or_false)
    new(true_or_false).call
  end

  def call
    response
  end

  private

  def initialize(true_or_false)
    @true_or_false = true_or_false
  end

  def response
    self.send(response_method)
  end

  def response_method
    "#{@true_or_false.to_s}_response"
  end

  def true_response
    "User was created."
  end

  def false_response
    "User wasn't created."
  end
end
