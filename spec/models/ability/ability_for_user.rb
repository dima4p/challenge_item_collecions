shared_examples 'ability for User' do
  all = [
    :index, :show, :create, :update, :destroy,
    :show_email, :show_login_info
  ]
  context 'when user is not logged in' do # User
    let(:user) {User.new}
    @permitted = [:create]
    @forbidden = all - @permitted

    @permitted.each do |action|
      it "should be able to #{action}" do
        expect(ability).to be_able_to(action, User.new)
      end
    end

    @forbidden.each do |action|
      it "should not be able to #{action}" do
        expect(ability).not_to be_able_to(action, User.new)
      end
    end
  end   # when user is not logged in

  context 'when user is normal' do # User
    let(:user) {create :active_user}
    @self = [
      :show, :update,
      :show_login_info, :show_email
    ]
    @forbidden = [
      :create, :destroy
    ]
    @active = [:index]
    @permitted = all - @self - @forbidden - @active

    @permitted.each do |action|
      it "should be able to #{action}" do
        expect(ability).to be_able_to(action, User.new)
      end
    end

    @forbidden.each do |action|
      it "should not be able to #{action}" do
        expect(ability).not_to be_able_to(action, User.new)
      end
    end

    @active.each do |action|
      it "should be able to #{action} for active user" do
        user = create :active_user
        expect(ability).to be_able_to(action, user)
      end

      it "should not be able to #{action} for not active user" do
        expect(ability).not_to be_able_to(action, User.new)
      end
    end

    @self.each do |action|
      it "should be able to #{action} for itself" do
        expect(ability).to be_able_to(action, user)
      end

      it "should not be able to #{action} for other user" do
        expect(ability).not_to be_able_to(action, User.new)
      end
    end

  end   # when user is normal
end
