class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]

    # GET /api/customers
    def index
      @customers = Customer.all
      render json: @customers
    end

    # POST /api/customers
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # GET /api/customers/1
    def show
      render json: @customer
    end

    # PATCH/PUT /api/customers/1
    def update
      if @customer.update(customer_params)
        render json: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/customers/1
    def destroy
      @customer.destroy
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :country, :voivodeship, :city, :post_code, 
        :phone, :company, :nip, :customer_type, :personal_number, :discount, :indetity_card, :note )
    end
end
