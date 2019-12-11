class Note < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, uniqueness: {scope: :notebook}

  belongs_to :notebook, optional: true
  delegate :user, :to => :notebook
end
