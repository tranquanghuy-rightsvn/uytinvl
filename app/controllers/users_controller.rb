class UsersController < ApplicationController
  before_action :check_current_user

  def edit; end

  def update
    current_user.update user_params

    respond_to do |format|
      format.js
    end
  end

  def change_password
    if current_user.update_with_password change_password_params
      sign_in current_user, bypass: true
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def change_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
