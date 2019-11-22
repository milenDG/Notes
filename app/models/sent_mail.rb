class SentMail < ApplicationRecord
  PHONE_NUMBER_REGEX = %r{\A([+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*)?\Z}.freeze
  EMAIL_REGEX = %r{\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\Z}.freeze

  validates :name, :email, :message, presence: true
  validates :email, format: {with: EMAIL_REGEX, message: '- enter a correct email!'}
  validates :telephone, format: {with: PHONE_NUMBER_REGEX, message: '- enter a correct phone number or do not enter any!'}

  belongs_to :user
end
