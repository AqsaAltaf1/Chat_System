class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @user = current_user
  end

  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:full_name)
  end

end
