staff_members = StaffMember.all

require './app/services/shared/constant_values'

256.times do |n|
  m = staff_members.sample
  e = m.events.build
  if m.active?
    if n.even?
      e.type = EventType::LOGIN
    else
      e.type = EventType::LOGOUT
    end
  else
    e.type = EventType::REJECTED
  end
  e.created_at = (256 - n).hours.ago
  e.save!
end
