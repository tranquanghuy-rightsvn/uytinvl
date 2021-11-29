# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_new_user
  
  def load_new_user
    @user = User.new
  end

  def check_current_user
    redirect_to root_path unless current_user
  end

  def redirect_to_root_path
    redirect_to root_path
  end
end
