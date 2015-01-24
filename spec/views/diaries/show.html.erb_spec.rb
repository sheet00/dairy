require 'rails_helper'

RSpec.describe "diaries/show", :type => :view do
  before(:each) do
    @diary = assign(:diary, Diary.create!(
      :category_id => 1,
      :title => "Title",
      :body => "Body",
      :wheather_id => 2,
      :mt_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
