class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :date_of_birth, presence: true

  # def send_registration_email
  # UserMailer.registration(self).deliver_now
  # end

end
