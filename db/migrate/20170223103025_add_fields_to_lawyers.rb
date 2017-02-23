class AddFieldsToLawyers < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :zip_code, :string
    add_column :lawyers, :country, :string
    add_column :lawyers, :city, :string
  end
end
