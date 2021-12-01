# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_to do |format|
      format.js
    end
  end

  def after_sign_out_path_for(resource)
    request.referrer
  end

  def after_sign_in_path_for(resource)
    request.referrer
  end
end
