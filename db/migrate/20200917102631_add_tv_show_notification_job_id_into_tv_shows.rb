class AddTvShowNotificationJobIdIntoTvShows < ActiveRecord::Migration[6.0]
  def change
    add_column :tv_shows, :tv_show_notification_job_id, :string
  end
end
