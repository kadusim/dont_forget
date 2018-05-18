require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user

  end

  describe "#LIST" do

    context "when user try access private list by other user" do

      before(:each) do
        @other_user_list_private = create(:list)     
        get :show, params: {id: @other_user_list_private.id}
      end

      it "returns http forbidden" do
        expect(response).to have_http_status(:forbidden)
      end

    end
  end

end
