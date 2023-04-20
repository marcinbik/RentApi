class Api::RentsController < ApplicationController
  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      render json: @rent, status: :created
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :price, :company_id)
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    head :no_content
  end

  def show
    @rent = Rent.find(params[:id])
    render json: @rent
  end

  def update
    @rent = Rent.find(params[:id])
    if @rent.update(rent_params)
      render json: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end
  
  

end
