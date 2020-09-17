class SendTvShowNotificationWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(show_id)
    tv_show = TvShow.find_by(id: show_id)
    if tv_show.present?
      favourite_users = tv_show.favorite_by_users
      favourite_users.each do |user|
        TvShowNotificationMailer.send_notification(user.id, tv_show.id)
      end
    end
  end

end