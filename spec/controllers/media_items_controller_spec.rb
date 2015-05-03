require 'rails_helper'

describe MediaItemsController, type: :controller do

  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # MediaItem. As you add validations to MediaItem, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:valid_attributes) {FactoryGirl.build(:media_item).attributes.slice *%w[name]}

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MediaItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all media_items as @media_items" do
      media_item = create :media_item
      media_item = MediaItem.find media_item.id
      get :index, {}, valid_session
      expect(assigns(:media_items)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:media_items)).to eq([media_item])
    end
  end

  describe "GET show" do
    it "assigns the requested media_item as @media_item" do
      media_item = create :media_item
      media_item = MediaItem.find media_item.id
      get :show, {id: media_item.to_param}, valid_session
      expect(assigns(:media_item)).to eq(media_item)
    end
  end

  describe "GET new" do
    it "assigns a new media_item as @media_item" do
      get :new, {}, valid_session
      expect(assigns(:media_item)).to be_a_new(MediaItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested media_item as @media_item" do
      media_item = create :media_item
      media_item = MediaItem.find media_item.id
      get :edit, {id: media_item.to_param}, valid_session
      expect(assigns(:media_item)).to eq(media_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MediaItem" do
        expect do
          post :create, {media_item: valid_attributes}, valid_session
        end.to change(MediaItem, :count).by(1)
      end

      it "assigns a newly created media_item as @media_item" do
        post :create, {media_item: valid_attributes}, valid_session
        expect(assigns(:media_item)).to be_a(MediaItem)
        expect(assigns(:media_item)).to be_persisted
      end

      it "redirects to the created media_item" do
        post :create, {media_item: valid_attributes}, valid_session
        expect(response).to redirect_to(MediaItem.last)
        # expect(response).to redirect_to(media_items_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved media_item as @media_item" do
        # allow_any_instance_of(MediaItem).to receive(:save).and_return(false)
        post :create, {media_item: invalid_attributes}, valid_session
        expect(assigns(:media_item)).to be_a_new(MediaItem)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(MediaItem).to receive(:save).and_return(false)
        post :create, {media_item: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end   # describe "POST create"

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {name: 'New value'} }

      it "updates the requested media_item" do
        media_item = create :media_item
        # expect_any_instance_of(MediaItem)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update, {id: media_item.to_param, media_item: new_attributes}, valid_session
        media_item.reload
        # skip("Add assertions for updated state")
        expect(media_item.name).to eq 'New value'
      end

      it "assigns the requested media_item as @media_item" do
        media_item = create :media_item
        media_item = MediaItem.find media_item.id
        put :update, {id: media_item.to_param, media_item: valid_attributes}, valid_session
        expect(assigns(:media_item)).to eq(media_item)
      end

      it "redirects to the media_item" do
        media_item = create :media_item
        media_item = MediaItem.find media_item.id
        put :update, {id: media_item.to_param, media_item: valid_attributes}, valid_session
        expect(response).to redirect_to(media_item_url(media_item))
      end
    end

    describe "with invalid params" do
      it "assigns the media_item as @media_item" do
        media_item = create :media_item
        # allow_any_instance_of(MediaItem).to receive(:update).and_return(false)
        put :update, {id: media_item.to_param, media_item: invalid_attributes}, valid_session
        expect(assigns(:media_item)).to be_a(MediaItem)
      end

      it "re-renders the 'edit' template" do
        media_item = create :media_item
        # allow_any_instance_of(MediaItem).to receive(:update).and_return(false)
        put :update, {id: media_item.to_param, media_item: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end   # describe "PUT update"

  describe "DELETE destroy" do
    it "destroys the requested media_item" do
      media_item = create :media_item
      expect do
        delete :destroy, {id: media_item.to_param}, valid_session
      end.to change(MediaItem, :count).by(-1)
    end

    it "redirects to the media_items list" do
      media_item = create :media_item
      delete :destroy, {id: media_item.to_param}, valid_session
      expect(response).to redirect_to(media_items_url)
    end
  end   # describe "DELETE destroy"

end
