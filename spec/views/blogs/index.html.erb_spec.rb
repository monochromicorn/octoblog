require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :name => "Name",
        :owner_id => 2,
        :url_slug => "Url Slug"
      ),
      Blog.create!(
        :name => "Name",
        :owner_id => 2,
        :url_slug => "Url Slug"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Url Slug".to_s, :count => 2
  end
end
