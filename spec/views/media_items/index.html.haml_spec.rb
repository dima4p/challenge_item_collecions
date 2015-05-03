require 'rails_helper'

describe "media_items/index", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = create(:media_item)
  end

  it "renders a list of media_items" do
    assign :media_items, [@media_item]
    render

    assert_select 'tr>td', text: @media_item.name.to_s, count: 1
    assert_select 'tr>td', text: @media_item.type.to_s, count: 1
    assert_select 'tr>td', text: @media_item.user.name, count: 1
    assert_select 'tr>td', text: @media_item.link.to_s, count: 1
    assert_select 'tr>td', text: @media_item.image.to_s, count: 1
  end

  it "renders a list of media_items in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(MediaItem, controller)
    render

    assert_select 'tr>td', text: @media_item.name.to_s, count: 1
    assert_select 'tr>td', text: @media_item.type.to_s, count: 1
    assert_select 'tr>td', text: @media_item.user.name, count: 1
    assert_select 'tr>td', text: @media_item.link.to_s, count: 1
    assert_select 'tr>td', text: @media_item.image.to_s, count: 1
  end
end
