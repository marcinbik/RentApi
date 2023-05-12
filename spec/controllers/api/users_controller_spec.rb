# spec/controllers/api/users_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let!(:users) { FactoryBot.create_list(:user, 3) }
  let(:user) { FactoryBot.create(:user) }
  
  describe "GET #index" do
    before { get :index }

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns a list of users" do
      expect(response.body).to eq(users.to_json)
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: user.id } }

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns the correct user" do
      expect(response.body).to eq(user.to_json)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { FactoryBot.attributes_for(:user) }

      it "creates a new user" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "returns a success response" do
        post :create, params: { user: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { FactoryBot.attributes_for(:user, email: nil) }

      it "does not create a new user" do
        expect {
          post :create, params: { user: invalid_attributes }
        }.to_not change(User, :count)
      end

      it "returns an unprocessable entity response" do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { FactoryBot.attributes_for(:user, name: "John") }

    before { put :update, params: { id: user.id, user: new_attributes } }

    it "updates the requested user" do
      expect(user.reload.name).to eq("John")
    end

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy, params: { id: user.id } }

    it "destroys the requested user" do
      expect(User.find_by(id: user.id)).to be_nil
    end

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end
  end
end
