class TvShow < ApplicationRecord
  # Validations
  validates_presence_of :name, :timing

  # Associations
  belongs_to :channel
  has_many :favorite_tv_shows
  has_many :favorite_by_users, through: :favorite_tv_shows, source: :user
  
  # Callbacks
  before_save :sheduler_tv_show_notification, if: :timing_changed?
  after_destroy :cancel_scheduled_notification, if: :tv_show_notification_job_id?

  def favorite?(user)
    favorite_by_users.include?(user)
  end
  
  private
    def sheduler_tv_show_notification
      cancel_scheduled_notification if tv_show_notification_job_id.present?
      self.tv_show_notification_job_id = SendTvShowNotificationWorker.perform_at(self.timing.to_time - 30.minutes, self.id)
    end

    def cancel_scheduled_notification
      Sidekiq::Status.cancel self.tv_show_notification_job_id
    end

end
