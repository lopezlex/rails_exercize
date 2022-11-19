class User < ApplicationRecord
  # This added after adding the MakeRegistrationsAJoinTable migration file
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy

  # through associations
  has_many :liked_events, through: :likes, source: :event


  has_secure_password

  # for validation form
  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/}, uniqueness: { case_sensitive: false}

end
