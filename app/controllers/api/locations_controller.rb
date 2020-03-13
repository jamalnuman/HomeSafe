class Api::LocationsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @locations = current_user.locations.all #the reason its called on a user is cause the locations are specif to a user
    render 'index.json.jb'
  end


  def create 
    @location = Location.new(name: params[:name],
                             address: params[:address],
                             phone_number: params[:phone_number]
                            )
    @location.latitude_longitude
    # @create_map

    if @location.save
      render 'show.json.jb'
    else
      render json: {errors: @location.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def show
    @location = Location.find(params[:id])
    render 'show.json.jb'
  end


  def update
    @location = Location.find(params[:id])

    @location.name = params[:name] || @location.name
    @location.address = params[:address] || @location.address
    @location.phone_number = params[:phone_number] || @location.phone_number
    @location.latitude = params[:latitude] || @location.latitude
    @location.longitude = params[:longitude] || @location.longitude

    if @location.save
      render 'show.json.jb'
    else
      render json: {errors: @location.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    render json: {message: "Location has been destroyed!"}
  end
end
