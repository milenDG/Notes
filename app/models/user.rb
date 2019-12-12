class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user may have many notebooks, which are irreversibly destroyed if the user is deleted
  has_many :notebooks, dependent: :destroy

  # A user has many notes throug the association with its notebooks
  has_many :notes, through: :notebooks

  # A user may have many quick notes
  has_many :quick_notes

  # A user may sent many emails
  has_many :sent_mails
end