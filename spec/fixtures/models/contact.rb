class Contact < ActiveRecord::Base
  belongs_to :user

  def to_hash
    attributes
  end
end
