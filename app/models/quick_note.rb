class QuickNote < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, :uniqueness => true

  belongs_to :user
end
