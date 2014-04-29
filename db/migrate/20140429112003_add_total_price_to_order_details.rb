class AddTotalPriceToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :total_price, :integer
  end
end
