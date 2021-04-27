require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        family: nil
      ),
      Member.create!(
        family: nil
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
