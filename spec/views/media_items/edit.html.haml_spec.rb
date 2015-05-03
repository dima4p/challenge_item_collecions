require 'rails_helper'

describe "media_items/edit", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = assign(:media_item, create(:media_item))
  end

  it "renders the edit media_item form" do
    render

    assert_select "form[action='#{media_item_path(@media_item)}'][method='post']" do
      assert_select 'input#media_item_name[name=?]', 'media_item[name]'
      assert_select 'input#media_item_type[name=?]', 'media_item[type]', count: 0
      assert_select 'select#media_item_user_id[name=?]', 'media_item[user_id]'
      assert_select 'input#media_item_link[name=?]', 'media_item[link]'
      assert_select 'input#media_item_image[name=?]', 'media_item[image]'
    end
  end
end
