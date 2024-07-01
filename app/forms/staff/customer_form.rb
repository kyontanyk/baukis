class Staff::CustomerForm
  include ActiveModel::Model

  attr_accessor :customer, :inputs_home_address, :inputs_work_address
  delegate :persisted?, :save, to: :customer

  def initialize(customer = nil)
    @customer = customer
    @customer ||= Customer.new(gender: 'mail')
    self.inputs_home_address = @customer.home_address.present?
    self.inputs_work_address = @customer.work_address.present?
    @customer.build_home_address unless @customer.home_address.present?
    @customer.build_work_address unless @customer.work_address.present?
  end

  def assign_attributes(params = {})
    @params = params

    customer.assign_attributes(customer_params)

    if inputs_home_address
      customer.home_address.assign_attributes(home_address_params)
    else
      customer.home_address = nil
    end
    if inputs_work_address
      customer.work_address.assign_attributes(work_address_params)
    else
      customer.work_address = nil
    end
  end

  def save
    customer.save
  end

  private def customer_params
    @params.require(:customer).permit(
      :email, :password,
      :family_name, :given_name, :family_name_kana, :given_name_kana,
      :birthday, :gender)
  end

  private def home_address_params
    @params.require(:home_address).permit(
      :postal_code, :prefecture, :city, :address1, :address2)
  end

  private def work_address_params
    @params.require(:work_address).permit(
      :postal_code, :prefecture, :city, :address1, :address2,
      :company_name, :division_name)
  end
end
