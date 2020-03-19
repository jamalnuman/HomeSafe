class Api::UserJourneysController < ApplicationController
  before_action :authenticate_user

  def index
    @user_journeys = current_user.user_journeys 
    render 'index.json.jb'
  end

  def create 
    @user_journey = UserJourney.find_or_create_by(user_id: params[:user_id],
                                                  journey_id: params[:journey_id] 
                                                  )

    @user_journey.completed = params[:completed] || false
    @user_journey.ending_location_id = params[:ending_location_id] if params[:ending_location_id]

    if @user_journey.save
      render 'show.json.jb'
    else
      render json: {errors: @user_journey.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def show
    @user_journey = UserJourney.find(params[:id])
    render 'show.json.jb'
  end


  def update
    @user_journey = UserJourney.find(params[:id])

    @user_journey.ending_location_id = params[:ending_location_id] || @user_journey.ending_location_id
    @user_journey.user_id = params[:user_id] || @user_journey.user_id
    @user_journey.journey_id = params[:journey_id] || @user_journey.journey_id
    @user_journey.completed = params[:completed] || @user_journey.completed

    if @user_journey.completed = true
      TwilioClient.new.send_text(@user_journey.user_id)
    end

    if @user_journey.save 
      render 'show.json.jb'
    else
      render json: {errors: @user_journey.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy
    @user_journey = UserJourney.find(params[:id])
    @user_journey.destroy
    render json: {message: "Your user journey is destroyed!"}
  end

end
