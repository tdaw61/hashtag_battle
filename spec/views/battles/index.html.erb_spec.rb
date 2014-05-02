require 'spec_helper'

describe "battles/index" do
  before(:each) do
    assign(:battles, [
      stub_model(Battle,
        :name => "Name",
        :tag_one => "Tag One",
        :tag_two => "Tag Two"
      ),
      stub_model(Battle,
        :name => "Name",
        :tag_one => "Tag One",
        :tag_two => "Tag Two"
      )
    ])
  end

  it "renders a list of battles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tag One".to_s, :count => 2
    assert_select "tr>td", :text => "Tag Two".to_s, :count => 2
  end
end
