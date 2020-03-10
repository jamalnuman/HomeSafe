class Api::UserJourneysController < ApplicationController

  def index
    @user_journeys = User.user_journeys
    render 'index.json.jb'
  end

  def create 
    @user_journey = 
  end

end
