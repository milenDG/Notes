class QuickNote < ApplicationRecord
  # Title and content must not be empty
  validates :title, :content, presence: true

  # The title must be unique for a specific user
  validates :title, uniqueness: { scope: :user }

  # The quick note belongs to its user
  belongs_to :user
end
