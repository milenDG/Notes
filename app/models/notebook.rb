class Notebook < ApplicationRecord
  # Title and description must not be empty
  validates :title, :description, :presence => true

  # The title of a notebook must be unique for a specific user.
  validates :title, uniqueness: {scope: :user}

  # The notebook belongs to a specific user
  belongs_to :user
  # A notebook contains many notes
  has_many :notes, dependent: :destroy
end
