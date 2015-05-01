require 'rails_helper'

describe UsersController, type: :controller do

  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:valid_attributes) {FactoryGirl.build(:user).attributes.slice *%w[email name]}

  let(:invalid_attributes) do
     {name: ''}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all users as @users" do
      user = create :user
      get :index, {}, valid_session
      expect(assigns(:users)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = create :user
      get :show, {id: user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = create :user
      get :edit, {id: user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect do
          post :create, {user: valid_attributes}, valid_session
        end.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {user: valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {user: valid_attributes}, valid_session
        expect(response).to redirect_to(User.last)
        # expect(response).to redirect_to(users_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {user: invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, {user: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end   # describe "POST create"

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {name: 'New value'} }

      it "updates the requested user" do
        user = create :user
        # expect_any_instance_of(User)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update, {id: user.to_param, user: new_attributes}, valid_session
        user.reload
        # skip("Add assertions for updated state")
        expect(user.name).to eq 'New value'
      end

      it "assigns the requested user as @user" do
        user = create :user
        put :update, {id: user.to_param, user: valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = create :user
        put :update, {id: user.to_param, user: valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = create :user
        # allow_any_instance_of(User).to receive(:update).and_return(false)
        put :update, {id: user.to_param, user: invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
      end

      it "re-renders the 'edit' template" do
        user = create :user
        # allow_any_instance_of(User).to receive(:update).and_return(false)
        put :update, {id: user.to_param, user: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end   # describe "PUT update"

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = create :user
      expect do
        delete :destroy, {id: user.to_param}, valid_session
      end.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = create :user
      delete :destroy, {id: user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end   # describe "DELETE destroy"

end
