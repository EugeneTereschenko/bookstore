class CartsController < InheritedResources::Base


  def show
    @cart_service = cart_service
  end

  def add_item(param = cart_params)
    @cart_service = cart_service
    @cart_service.add_item(param[:add_item])
    redirect_back(fallback_location: root_path)
  end

  def coupon(param = cart_params)

    code = param[:code]
    logger.warn code
    #return redirect_back(fallback_location: root_path) if code = '' || code.nil?
    logger.warn "Stop"

    cart = Cart.find_by(user_id: current_user.id)
    coupon = Coupon.find_by(code: code).value
    cart.update(coupon: coupon)
    redirect_back(fallback_location: root_path)

    rescue StandardError
    redirect_back(fallback_location: rdot_path)
  end

  def checkout
    @cart_service = cart_service
    errors = @cart_service.payment
    if errors.nil?
      #redirect_to checkout_steps_path
      redirect_to "/checkout_steps/checkout_address"
    else
      flash[:alert] = 'Cart: Error payment!'
      redirect_back(fallback_location: root_path)
    end
  end

  def delete_item(param = cart_params)

  end

  private

  def cart
    cart = Cart.find_by(user_id: current_user.id)
    cart = Cart.create(user_id: current_user.id) if cart.nil?
    cart
  end

  def cart_service
    cart_service = CartService.new
    cart_service.load(cart)
    cart_service
  end

  def cart_params
    params.permit(:code, :increment, :decrement, :delete_item, :add_item, :quantity)
  end

end

