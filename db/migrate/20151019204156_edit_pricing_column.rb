class EditPricingColumn < ActiveRecord::Migration
  def change
  	change_column :products, :pricing, :decimal, :precision => 16, :scale => 2
  end
end
