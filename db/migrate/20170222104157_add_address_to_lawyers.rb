class AddAddressToLawyers < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :address, :string
  end
end
