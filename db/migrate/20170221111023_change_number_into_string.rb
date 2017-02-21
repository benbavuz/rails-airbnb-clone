class ChangeNumberIntoString < ActiveRecord::Migration[5.0]
  def change
    change_column :lawyers, :phone_number, :string
  end
end
