require 'rails_helper'

RSpec.describe "diaries/new", :type => :view do
  before(:each) do
    assign(:diary, Diary.new(
      :category_id => 1,
      :title => "MyString",
      :body => "MyString",
      :wheather_id => 1,
      :mt_id => 1
    ))
  end

  it "renders new diary form" do
    render

    assert_select "form[action=?][method=?]", diaries_path, "post" do

      assert_select "input#diary_category_id[name=?]", "diary[category_id]"

      assert_select "input#diary_title[name=?]", "diary[title]"

      assert_select "input#diary_body[name=?]", "diary[body]"

      assert_select "input#diary_wheather_id[name=?]", "diary[wheather_id]"

      assert_select "input#diary_mt_id[name=?]", "diary[mt_id]"
    end
  end
end
