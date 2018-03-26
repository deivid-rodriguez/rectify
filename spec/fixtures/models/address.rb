class Address < ActiveRecord::Base
  def to_hash
    attributes
  end
end
