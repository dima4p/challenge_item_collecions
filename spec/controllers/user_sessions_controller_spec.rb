require 'rails_helper'

describe UserSessionsController, type: :controller do

  render_views

  describe "GET new" do
    it "new action should render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it 'should create a new user session' do
        user = create :old_user
        post :create, user_session: { email: user.email, password: "password" }
        expect(UserSession.find.user).to eq user
      end

      it "should redirect to root url" do
        user = create :old_user
        post :create, user_session: { email: user.email, password: "password" }
        expect(response).to redirect_to("/")
      end
    end

    describe "with invalid params" do
      it 'should not create a session' do
        post :create, user_session: { email: "foo", password: "badpassword" }
        expect(UserSession.find).to be_nil
      end

      it "should render new template" do
        post :create, user_session: { email: "foo", password: "badpassword" }
        expect(response).to render_template(:new)
      end
    end
  end   # describe "POST create"

  describe "DELETE destroy" do
    it 'destroys the user session' do
      user = create :old_user
      post :create, user_session: { email: user.email, password: "password" }
      delete :destroy
      expect(UserSession.find).to be_nil
    end
  end
end
