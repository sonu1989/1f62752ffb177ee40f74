class WelcomeController < ApplicationController

  def index
    if params[:search_term].present?
      search_keyword = "%#{params[:search_term].downcase}%"
      # Here I am not using ILIKE becuase app is using sqlite and Ilike is not supported by it.
      @tv_shows = TvShow.includes(:channel, :favorite_by_users).where('lower(channels.name) LIKE (?) OR lower(tv_shows.name) LIKE (?)', search_keyword, search_keyword).references(:channels)
    else
      @tv_shows = TvShow.includes(:channel, :favorite_by_users)
    end
  end
end
