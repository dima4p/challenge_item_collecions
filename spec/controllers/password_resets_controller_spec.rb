require 'rails_helper'

describe PasswordResetsController, type: :controller do

  def mock_user(stubs = {})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      # user.stub(stubs) unless stubs.empty?
      stubs.each do |k, v|
        allow(user).to receive(k) {v}
      end
    end
  end

  describe "GET new" do
    it "renders the 'new' template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    describe "with valid params" do
      before :each do
        expect(User).to receive(:find_using_perishable_token).with('37').and_return(mock_user)
      end

      it "assigns the found user as @user" do
        get :edit, id: "37"
        expect(assigns(:user)).to eql(mock_user)
      end

      it "renders the 'edit' template" do
        get :edit, id: "37"
        expect(response).to render_template("edit")
      end
    end

    describe "with invalid params" do
      before :each do
        expect(User).to receive(:find_using_perishable_token).with('37').and_return(nil)
      end

      it "redirects to the root_path" do
        get :edit, id: "37"
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before :each do
        expect(User).to receive(:find_by_email).with('a@b.com').and_return(mock_user)
        expect(mock_user).to receive(:deliver_password_reset_instructions!)
      end

      it "finds the user by email" do
        post :create, email: 'a@b.com'
        expect(assigns(:user)).to be(mock_user)
      end

      it "redirects to the login_path" do
        post :create, email: 'a@b.com'
        expect(response).to redirect_to(login_path)
      end
    end

    describe "with invalid params" do
      before :each do
        expect(User).to receive(:find_by_email).with('a@b.com').and_return(nil)
      end

      it "re-renders the 'new' template" do
        post :create, email: 'a@b.com'
        expect(response).to render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      let(:user) {create :user, :old}

      it "updates the user with the given password" do
        user    # not to trigger the expectations below
        expect_any_instance_of(User).to receive(:password=).with('password123')
        expect_any_instance_of(User).to receive(:password_confirmation=).with('password123')
        put :update, id: user.perishable_token, password: 'password123', password_confirmation: 'password123'
      end

      it "assigns the found user as @user" do
        put :update, id: user.perishable_token
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        put :update, id: user.perishable_token, password: 'password123', password_confirmation: 'password123'
        expect(response).to redirect_to(user_url(user))
      end
    end

    describe "with wrong :id" do
      before :each do
        expect(User).to receive(:find_using_perishable_token).with('37').and_return(nil)
      end

      it "redirects to the root_path" do
        put :update, id: "37"
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      before :each do
        # rubocop:disable Style/IndentHash
        expect(User)
          .to receive(:find_using_perishable_token).with('37').and_return(mock_user(
            :password= => true,
            :password_confirmation= => true,
            save: false
          ))
      end

      it "assigns the found user as @user" do
        put :update, id: "37"
        expect(assigns(:user)).to be(mock_user)
      end

      it "re-renders the 'edit' template" do
        put :update, id: "37"
        expect(response).to render_template("edit")
      end
    end

  end

end
