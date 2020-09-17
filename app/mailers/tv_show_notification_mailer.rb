class TvShowNotificationMailer < ApplicationMailer

  def send_notification(user_id, tv_show_id)
    @user =  User.find_by(id: user_id)
    @tv_show =  TvShow.find_by(id: tv_show_id)
    mail(to: @user.email, subject: "Notification for #{@tv_show.name}")
  end

end
