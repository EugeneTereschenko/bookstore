require 'rails_helper'

RSpec.describe "carts/new", type: :view do
  before(:each) do
    assign(:cart, Cart.new(
      :order_total_price => "9.99",
      :precision => "9.99",
      :scale => "9.99"
    ))
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do

      assert_select "input[name=?]", "cart[order_total_price]"

      assert_select "input[name=?]", "cart[precision]"

      assert_select "input[name=?]", "cart[scale]"
    end
  end
end
