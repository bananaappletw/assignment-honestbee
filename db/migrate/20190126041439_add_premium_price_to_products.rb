class AddPremiumPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :premium_price, :integer
  end
end
