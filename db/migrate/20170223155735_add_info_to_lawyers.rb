class AddInfoToLawyers < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :description, :string
    add_column :lawyers, :payments, :string, array: true, default: []
  end
end
