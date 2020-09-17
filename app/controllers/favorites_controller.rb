class FavoritesController < ApplicationController
  
  def index
    @favorite_tv_shows = current_user.favorite_tv_shows
  end

  def favorite
    favorite_tv_show = current_user.favorite_tv_shows.new(tv_show_id: params[:tv_show_id])
    if favorite_tv_show.save
      flash[:notice] = 'You have marked this tv show as favorite.'
    else
      flash[:alert] = "Error! #{favorite_tv_show.errors.full_messages.to_sentence}"
    end
    redirect_to root_path
  end

  def unfavorite
    favorite_tv_show = current_user.favorite_tv_shows.find_by(tv_show_id: params[:tv_show_id])
    if favorite_tv_show.destroy
      flash[:notice] = 'You have removed this tv show from favorite.'
    else
      flash[:alert] = "Error! In Removing favorite "
    end
    redirect_to root_path
  end

end
