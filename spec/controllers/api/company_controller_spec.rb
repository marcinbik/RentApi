 # frozen_string_literal: true

 require 'rails_helper'

 RSpec.describe Api::CompanyController, type: :controller do
   let!(:companies) { FactoryBot.create_list(:company, 3) }
   let!(:company) { FactoryBot.create(:company) }

   describe "GET #index" do
     before { get :index }

     it "returns a success response" do
       expect(response).to have_http_status(:ok)
     end
     it "returns a list of companies" do
       expect(response.body).to eq(companies.to_json)
     end
   end

   describe "GET #show" do
    before { get :show, params: { id: company.id } }

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns the correct company" do
      expect(response.body).to eq(company.to_json)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryBot.attributes_for(:company) }
      it "creates a new company" do
        expect {
          post :create, params: { company: valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it "returns a success response" do
        post :create, params: { company: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
  #   context "with invalid attributes" do
  #     let(:invalid_attributes) { FactoryBot.attributes_for(:company, name: nil) }

  #     it "does not create a new company" do
  #       expect {
  #         post :create, params: { company: invalid_attributes }
  #       }.to_not change(Company, :count)
  #     end

  #     it "returns an unprocessable entity response" do
  #       post :create, params: { company: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end
  # end
