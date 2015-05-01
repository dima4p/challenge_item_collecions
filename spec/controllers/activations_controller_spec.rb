require 'rails_helper'

describe ActivationsController , type: :controller do

  render_views

  let(:user) {create :old_user}

  describe "POST create" do
    describe "with valid params" do
      it 'finds user and assigns it to @user' do
        post :create, code: user.perishable_token
        expect(assigns(:user)).to eq(user)
      end

      it 'sends :deliver_welcome! to the user' do
        expect_any_instance_of(User).to receive(:deliver_welcome!)
        post :create, code: user.perishable_token
      end
    end

    it 'redirects to root_url' do
      post :create, code: 'any code'
      expect(response).to redirect_to(root_url)
    end
  end
end
