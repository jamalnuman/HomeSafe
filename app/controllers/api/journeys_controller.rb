class Api::JourneysController < ApplicationController
  before_action :authenticate_user

  def index
    @journeys = current_user.journeys
    render 'index.json.jb'
  end

  def add_users
    @journey = Journey.find(params[:id])
    @users = params[:user_ids] #this comes from the frontend..when adding users to the Journey
    @users.map do |user_id|
      user_journey = UserJourney.create(user_id: user_id,
                         journey_id: @journey.id,
                         completed: false)
      user_journey.save 
    end
    render 'show.json.jb'
  end


  def create
    @journey = Journey.new(starting_location_id: params[:starting_location_id]) 

    if @journey.save
      UserJourney.create(user_id: current_user.id, #this is for the specific user logged on. different from the add_user method above.
                         journey_id: @journey.id,
                         completed: false) 
      render 'show.json.jb'
    else
      render json: {errors: @journey.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def show
    @journey = Journey.find(params[:id])
    render 'show.json.jb'
  end


  def update
    @journey = Journey.find(params[:id])

    @journey.starting_location_id = params[:starting_location_id] || @journey.starting_location_id

    if @journey.save
      render 'show.json.jb'
    else
      render json: {errors: @journey.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy
    render json: {message: "Your journey is destroyed!"}
  end
end
