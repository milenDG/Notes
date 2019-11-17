class Note < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, :uniqueness => true

  belongs_to :notebook, optional: true
end
