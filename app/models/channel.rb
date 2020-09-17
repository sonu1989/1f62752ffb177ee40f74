class Channel < ApplicationRecord
  
  # Validations
  validates_presence_of :name

  # Associations
  has_many :tv_shows, dependent: :destroy
end
