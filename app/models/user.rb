class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :age, :gender
  validates_inclusion_of :gender, in: ['Male', 'Female', 'Other']
  validates_inclusion_of :age, in: (13..100).map(&:to_s)

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address, reject_if: :all_blank

  #@user = User.find(1)
  #@user.full_name
  def full_name
    "#{first_name} #{last_name}"
  end

  #User.by_age
  def self.by_age
    order(:age)
  end
end