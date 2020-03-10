class Api::JourneysController < ApplicationController

  def index
    @journeys = current_user.journeys
    render 'index.json.jb'
  end


  def create
    @journey = Journey.new(starting_location_id: user.location.id) #dont think this is correct

    if @journey.save 
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
