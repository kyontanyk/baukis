class Customer < ApplicationRecord
  include StringNormalizer
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder

  has_one :home_address, dependent: :destroy
  has_one :work_address, dependent: :destroy

  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, date: {
    after: Date.new(1900, 1, 1),
    before: ->(obj) { Date.today },
    allow_blank: true
  }
end
