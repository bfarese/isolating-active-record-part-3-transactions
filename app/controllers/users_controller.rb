class UsersController < ApplicationController
  def index
    @users = users_repo.all
  end

  def new
  end

  def create
    @user = create_transaction.user
    creation_response
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def users_repo
    @users_repo ||= Users::Repository.new
  end

  def create_transaction
    @create_transaction ||= Users::Transaction::Create.call(user_params)
  end

  def creation_response
    self.send("user_created_#{create_transaction.legitimate?}")
  end

  def user_created_true
    flash[:notice] = create_transaction.message
    redirect_to action: :index
  end

  def user_created_false
    flash.now[:alert] = create_transaction.message
    @errors = create_transaction.errors
    render :new
  end
end
