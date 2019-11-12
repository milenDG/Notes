class Note < ApplicationRecord
  validates :name, :text, :presence => true
  validates :name, :uniqueness => true

  belongs_to :collections
end
