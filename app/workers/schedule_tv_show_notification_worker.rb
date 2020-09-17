class ScheduleTvShowNotificationWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(show_id)
    tv_show = TvShow.find(show_id)
    if tv_show.present?
      tv_show_notification_job_id = SendTvShowNotificationWorker.perform_at(tv_show.timing.to_time - 30.minutes, tv_show.id)
      tv_show.update_attribute(tv_show_notification_job_id: tv_show_notification_job_id)
    end
  end

end