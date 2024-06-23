class StaffEvent < ApplicationRecord
  self.inheritance_column = nil

  require './app/services/shared/constant_values'

  belongs_to :member, class_name: 'StaffMember', foreign_key: 'staff_member_id'

  DESCRIPTIONS = {
    EventType::LOGIN.to_sym => 'ログイン',
    EventType::LOGOUT.to_sym => 'ログアウト',
    EventType::REJECTED.to_sym => 'ログイン拒否'
  }

  def description
    DESCRIPTIONS[type.to_sym]
  end
end
