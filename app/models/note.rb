class Note < ApplicationRecord
  validates :title, :description, :notebook_id, :presence => true
  validates :title, :uniqueness => true


  belongs_to :notebook
end
