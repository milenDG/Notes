class Notebook < ApplicationRecord
  validates :title, :description, :presence => true
  validates :title, uniqueness: {scope: :user}


  belongs_to :user
  has_many :notes, dependent: :destroy
end
