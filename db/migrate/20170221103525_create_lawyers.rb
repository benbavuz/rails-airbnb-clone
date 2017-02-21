class CreateLawyers < ActiveRecord::Migration[5.0]
  def change
    create_table :lawyers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
