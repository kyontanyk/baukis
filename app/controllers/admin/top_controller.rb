class Admin::TopController < Admin::Base
  def index
    if current_administrator
      render action: 'dashboard'
    end
  end
end
