class Staff::CustomerForm
  include ActiveModel::Model

  attr_accessor :customer
  delegate :persisted?, to: :customer

  def initialize(customer = nil)
    @customer = customer
    @customer ||= Customer.new(gender: 'mail')
    @customer.build_home_address unless @customer.home_address.present?
    @customer.build_work_address unless @customer.work_address.present?
  end
end
