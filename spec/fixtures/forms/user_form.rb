require_relative "address_form"
require_relative "contact_form"

class UserForm < Rectify::Form
  mimic :user

  attribute :first_name,  String
  attribute :age,         Dry::Types["coercible.integer"]
  attribute :colours,     Dry::Types["array"]
  attribute :address,     AddressForm
  attribute :contacts,    Dry::Types["array"].of(ContactForm)
  attribute :order_count, Integer
  attribute :other_id,    Dry::Types["coercible.integer"]
  attribute(:last_login_date, Dry::Types["string"].constructor do |value|
    value.strftime("%d/%m/%Y")
  end)

  validates :first_name, :presence => true

  def self.model_mapping(model)
    {
      :last_login_date => model.last_logged_in
    }
  end
end
