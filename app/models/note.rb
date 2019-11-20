class Note < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, uniqueness: {scope: :user}

  belongs_to :notebook, optional: true
end
