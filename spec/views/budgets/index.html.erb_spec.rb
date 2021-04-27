require 'rails_helper'

RSpec.describe "budgets/index", type: :view do
  before(:each) do
    assign(:budgets, [
      Budget.create!(
        category: "Category",
        member: nil,
        time_frame: 2,
        days: 3
      ),
      Budget.create!(
        category: "Category",
        member: nil,
        time_frame: 2,
        days: 3
      )
    ])
  end

  it "renders a list of budgets" do
    render
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
