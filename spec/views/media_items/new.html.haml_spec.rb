require 'rails_helper'

describe "media_items/new", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = assign(:media_item, build(:media_item))
  end

  it "renders new media_item form" do
    render

    assert_select "form[action='#{media_items_path}'][method='post']" do
      assert_select 'input#media_item_name[name=?]', 'media_item[name]'
      assert_select 'input#media_item_type[name=?]', 'media_item[type]'
      assert_select 'select#media_item_user_id[name=?]', 'media_item[user_id]'
      assert_select 'input#media_item_link[name=?]', 'media_item[link]'
      assert_select 'input#media_item_image[name=?]', 'media_item[image]'
    end
  end
end
