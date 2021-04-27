require 'rails_helper'

RSpec.describe "budgets/edit", type: :view do
  before(:each) do
    @budget = assign(:budget, Budget.create!(
      category: "MyString",
      member: nil,
      time_frame: 1,
      days: 1
    ))
  end

  it "renders the edit budget form" do
    render

    assert_select "form[action=?][method=?]", budget_path(@budget), "post" do

      assert_select "input[name=?]", "budget[category]"

      assert_select "input[name=?]", "budget[member_id]"

      assert_select "input[name=?]", "budget[time_frame]"

      assert_select "input[name=?]", "budget[days]"
    end
  end
end
