class AddUserToLawyers < ActiveRecord::Migration[5.0]
  def change
    add_reference :lawyers, :user, foreign_key: true
  end
end
