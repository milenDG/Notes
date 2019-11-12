class Collection < ApplicationRecord
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true


  belongs_to :user
  has_many :notes, dependent: :destroy
end
