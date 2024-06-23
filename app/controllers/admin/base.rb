class Admin::Base < ApplicationController

  TIMEOUT = 30.minutes

  before_action :authorize
  before_action :check_account
  before_action :check_timeout

  private def authorize
    unless current_administrator
      flash.alert = '管理者としてログインしてください。'
      redirect_to :admin_login
    end
  end

  private def check_account
    if current_administrator&.suspended?
      session.delete(:administrator_id)
      flash.alert = 'アカウントが無効になりました。'
      redirect_to :admin_root
    end
  end

  private def check_timeout
    if current_administrator
      if TIMEOUT.ago <= session[:admin_last_access_time]
        session[:admin_last_access_time] = Time.current
      else
        session.delete(:administrator_id)
        flash.alert = 'セッションがタイムアウトしました。'
        redirect_to :admin_login
      end
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
