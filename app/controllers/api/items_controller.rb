# frozen_string_literal: true

module Api
  # item Controller 
  class ItemsController < ApplicationController
    before_action :set_company
    before_action :set_item, only: [:show, :update, :destroy]

    # POST /api/companies/:company_id/items
    def create
      @item = @company.items.build(item_params)

      if @item.save
        render json: @item, status: :created
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/companies/:company_id/items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    # GET /api/companies/:company_id/items/:id
    def show
      render json: @item
    end

    # PATCH/PUT /api/companies/:company_id/items/:id
    def update
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    private

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_item
      @item = @company.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :name, :evidential_1, :evidential_2, :evidential_3,
        :item_type, :item_status, :price_hours_cents, :price_hours_currency,
        :price_minute_cents, :price_minute_currency, :price_minute_currency,
        :price_day_currency, :deposit_cents, :deposit_currency, :use_limit,
        :note, :company_id
      )
    end
  end
end
