require 'rails_helper'

RSpec.describe "carts/index", type: :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :order_total_price => "9.99",
        :precision => "9.99",
        :scale => "9.99"
      ),
      Cart.create!(
        :order_total_price => "9.99",
        :precision => "9.99",
        :scale => "9.99"
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
