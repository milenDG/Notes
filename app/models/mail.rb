class Mail < ApplicationRecord
  PHONE_NUMBER_REGEX = /[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*/.freeze
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/.freeze

  validates :name, :email, :message, :presence => true
  validates :telephone, format: { with: PHONE_NUMBER_REGEX, message: 'Please enter a correct phone number!'}
  validates :email, format: {with: EMAIL_REGEX, message: 'Please enter a correct phone number!'}


  belongs_to :user
end
