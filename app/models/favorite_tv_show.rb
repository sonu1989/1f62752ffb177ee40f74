class FavoriteTvShow < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :tv_show
end
