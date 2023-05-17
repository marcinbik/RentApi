class Api::RentsController < ApplicationController
  # index for copany
  def index_for_company
    @company = Company.find(params[:company_id])
    @rents = @company.rents

    render json: @rents
  end

  # create
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
    params.require(:rent).permit(:when, :when_return, :declare_return, :rent_status, :rent_type, :price_hours_cents, :price_hours_currency, :price_minute_cents, :price_day_cents, :price_day_currency, :deposit_cents, :deposit_currency, :sumary_cost_cents, :sumary_cost_currency, :note, :company_id, :user_id, :customers_id )
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
