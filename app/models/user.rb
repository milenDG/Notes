class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notebooks, dependent: :destroy
  has_many :notes, through: :notebooks
  has_many :quick_notes
  has_many :sent_mails
end