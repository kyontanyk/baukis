class Staff::SessionsController < Staff::Base

  require './app/services/shared/constant_values'

  skip_before_action :authorize

  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
    end
  end

  def create
    @form = Staff::LoginForm.new(login_form_params)
    if @form.email.present?
      staff_member = StaffMember.find_by(
        'LOWER(email) = ?',
        @form.email.downcase)
    end
    if staff_member.present? \
      && Staff::Authenticator.new(staff_member).authenticate(@form.password)
      if staff_member.suspended?
        staff_member.events.create!(type: EventType::REJECTED)
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        staff_member.events.create!(type: EventType::LOGIN)
        session[:staff_member_id] = staff_member.id
        session[:last_access_time] = Time.current
        flash.notice = 'ログインしました。'
        redirect_to :staff_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    if current_staff_member
      current_staff_member.events.create!(type: EventType::LOGOUT)
    end
    session.delete(:staff_member_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :staff_root
  end

  private def login_form_params
    params.require(:staff_login_form).permit(:email, :password,)
  end
end
