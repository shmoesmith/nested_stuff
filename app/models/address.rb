class Address < ApplicationRecord
  # Validations
  validates_presence_of :street, :city, :zip, :state

  # Associations
  # Optional True needs to be set for nested_attributes Rails 5
  belongs_to :user, optional: true

  # Instance Method
  def us_formatted
    "#{street} #{city}, #{state} #{zip}"
  end

  # Class Method
  def self.by_state
    order(:state)
  end
end
