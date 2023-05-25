class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # POST /api/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # index 
  def index
    @users = User.all
    render json: @users
  end

  # DELETE /api/users/:id
  def destroy
    @user.destroy
    head :ok
  end

  # GET /api/users/:id
  def show
    render json: @user
  end

  # PATCH/PUT /api/users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :country, :city, :post_code, :phone, :nip, :role,
       :personal_number, :passwd)
  end
end
