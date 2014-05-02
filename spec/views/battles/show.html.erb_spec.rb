require 'spec_helper'

describe "battles/show" do
  before(:each) do
    @battle = assign(:battle, stub_model(Battle,
      :name => "Name",
      :tag_one => "Tag One",
      :tag_two => "Tag Two"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Tag One/)
    rendered.should match(/Tag Two/)
  end
end
