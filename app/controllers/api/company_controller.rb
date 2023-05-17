class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :update, :destroy]

    # GET /api/companies
    def index
      @companies = Company.all
      render json: @companies
    end

    # POST /api/companies
    def create
      @company = Company.new(company_params)

      if @company.save
        render json: @company, status: :created
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end

    # GET /api/companies/1
    def show
      render json: @company
    end

    # PATCH/PUT /api/companies/1
    def update
      if @company.update(company_params)
        render json: @company
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/companies/1
    def destroy
      @company.destroy
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :address, :nip, :type, :phone, :note)
    end
end