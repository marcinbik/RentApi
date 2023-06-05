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
 end