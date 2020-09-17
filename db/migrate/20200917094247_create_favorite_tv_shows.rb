class CreateFavoriteTvShows < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_tv_shows do |t|
      t.references :user, index: true
      t.references :tv_show, index: true
      t.timestamps
    end
  end
end
