class AddOrderIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :order
  end
end
