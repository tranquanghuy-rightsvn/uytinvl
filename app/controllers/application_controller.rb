# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_new_user
  
  def load_new_user
    @user = User.new
  end
end
