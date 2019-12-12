class Note < ApplicationRecord
  # Title and content must not be empty.
  validates :title, :content, :presence => true

  # The title must be unique for each user
  validates :title, uniqueness: {scope: :notebook}

  # The not belongs to a notebook, where many notes are stored
  belongs_to :notebook, optional: true

  # Add a connection to the user through the notebook
  delegate :user, :to => :notebook
end
