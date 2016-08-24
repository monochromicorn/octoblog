require 'rails_helper'

RSpec.describe "blogs/new", type: :view do
  before(:each) do
    assign(:blog, Blog.new(
      :name => "MyString",
      :owner_id => 1,
      :url_slug => "MyString"
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "input#blog_name[name=?]", "blog[name]"

      assert_select "input#blog_owner_id[name=?]", "blog[owner_id]"

      assert_select "input#blog_url_slug[name=?]", "blog[url_slug]"
    end
  end
end
