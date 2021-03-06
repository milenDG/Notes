class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Name, email and message must not be empty
  validates :name, :email, :password, presence: true

  # Regex validating a correct Email address (constant)
  EMAIL_REGEX = %r{\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\Z}.freeze

  # The email must follow the format specified by the regex
  validates :email, format: {with: EMAIL_REGEX, message: I18n.t('email_validation_feedback') }

  # A user may have many notebooks, which are irreversibly destroyed if the user is deleted
  has_many :notebooks, dependent: :destroy

  # A user has many notes throug the association with its notebooks
  has_many :notes, through: :notebooks

  # A user may have many quick notes
  has_many :quick_notes

  # A user may sent many emails
  has_many :sent_mails
end