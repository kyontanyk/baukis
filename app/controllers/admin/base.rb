class Admin::Base < ApplicationController

  before_action :authorize

  private def authorize
    unless current_administrator
      flash.alert = '管理者としてログインしてください。'
      redirect_to :admin_login
    end
  end

  private def current_administrator
    if session[:administrator_id]
      @administrator_id \
        ||= Administrator.find_by(id: session[:administrator_id])
    end
  end

  helper_method :current_administrator
end
