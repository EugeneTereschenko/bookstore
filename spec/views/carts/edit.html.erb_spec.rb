require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :order_total_price => "9.99",
      :precision => "9.99",
      :scale => "9.99"
    ))
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do

      assert_select "input[name=?]", "cart[order_total_price]"

      assert_select "input[name=?]", "cart[precision]"

      assert_select "input[name=?]", "cart[scale]"
    end
  end
end
