require 'rails_helper'

RSpec.describe "diary_counts/show", :type => :view do
  before(:each) do
    @diary_count = assign(:diary_count, DiaryCount.create!(
      :year => 1,
      :month => 2,
      :monthly_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
