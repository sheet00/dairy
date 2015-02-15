require 'rails_helper'

RSpec.describe "weathers/show", type: :view do
  before(:each) do
    @weather = assign(:weather, Weather.create!(
      :id => 1,
      :file_name => "File Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/File Name/)
  end
end
