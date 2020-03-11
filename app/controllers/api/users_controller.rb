class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jb'
  end

  def create
    user = User.new(first_name: params[:first_name], 
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number], 
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      render json: {message: "User created successfully"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end 


  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.phone_number = params[:phone_number] || @user.phone_number

    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end 


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: 'User has been deleted!'}
  end
end
