class UsersController < ApplicationController
  before_action :check_current_user

  def edit; end

  def update
    current_user.update user_params
    
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end

