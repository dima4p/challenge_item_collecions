require 'rails_helper'

describe "media_items/show", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = assign(:media_item, create(:media_item))
  end

  it "renders attributes in <dl>" do
    render
    assert_select 'dl>dd', text: Regexp.new(@media_item.name.to_s)
    assert_select 'dl>dd', text: Regexp.new(@media_item.type.to_s)
    assert_select 'dl>dd', text: Regexp.new(@media_item.user.name)
    assert_select 'dl>dd', text: Regexp.new(@media_item.link.to_s)
    assert_select 'dl>dd', text: Regexp.new(@media_item.image.to_s)
  end
end
