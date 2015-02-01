require 'rails_helper'

RSpec.describe "diary_counts/new", :type => :view do
  before(:each) do
    assign(:diary_count, DiaryCount.new(
      :year => 1,
      :month => 1,
      :monthly_count => 1
    ))
  end

  it "renders new diary_count form" do
    render

    assert_select "form[action=?][method=?]", diary_counts_path, "post" do

      assert_select "input#diary_count_year[name=?]", "diary_count[year]"

      assert_select "input#diary_count_month[name=?]", "diary_count[month]"

      assert_select "input#diary_count_monthly_count[name=?]", "diary_count[monthly_count]"
    end
  end
end
