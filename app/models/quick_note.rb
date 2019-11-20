class QuickNote < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, uniqueness: {scope: :user}

  belongs_to :user
end
