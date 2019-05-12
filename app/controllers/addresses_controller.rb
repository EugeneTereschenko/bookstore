class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addressable = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    addr = AddressService.new
    @billing = addr.billing_address(current_user)
    @shipping = addr.shipping_address(current_user)
  end

  def save
    errors = AddressService.new.save(current_user, address_params)
    if errors.nil?
      flash[:notice] = "Address saved!"
    else
      flash[:alert] = "Error save address."
    end
    redirect_back(fallback_location: root_path)
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    errors = Address.new.save(current_user, address_params)

    redirect_back(fallback_location: root_path)

    #respond_to do |format|
    #  if @address.save
     #   format.html { redirect_to @address, notice: 'Address was successfully created.' }
    #    format.json { render :show, status: :created, location: @address }
    #  else
    #    format.html { render :new }
     #   format.json { render json: @address.errors, status: :unprocessable_entity }
    #  end
   # end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.permit(:address_type, :first_name, :last_name, :address, :city, :zip, :country, :phone, :user_id, :checkbox_id, :order_id)
    end
end
