class Customer::Base < ApplicationController
  private

  def current_customer_member
    if session[:customer_member_id]
      @customer_member_id \
        ||= CustomerMember.find_by(id: session[:customer_member_id])
    end
  end

  helper_method :current_customer_member
end
