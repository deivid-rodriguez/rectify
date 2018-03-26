require_relative "phone_form"

class ContactForm < Rectify::Form
  attribute :name,   String
  attribute :number, String
  attribute :phones, Dry::Types["array"].of(PhoneForm)

  validates :name, :presence => true
end
