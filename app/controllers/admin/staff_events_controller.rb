class Admin::StaffEventsController < ApplicationController
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member.events.order(created_at: :desc)
    else
      @events = StaffEvent.order(created_at: :desc)
    end
  end
end
