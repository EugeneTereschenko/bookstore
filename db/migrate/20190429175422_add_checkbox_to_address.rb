class AddCheckboxToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :checkbox
  end
end
