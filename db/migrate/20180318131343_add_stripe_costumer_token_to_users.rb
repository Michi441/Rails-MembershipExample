class AddStripeCostumerTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_costumer_token, :string
  end
end
