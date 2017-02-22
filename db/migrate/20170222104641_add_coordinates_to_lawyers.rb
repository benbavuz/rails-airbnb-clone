class AddCoordinatesToLawyers < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :latitude, :float
    add_column :lawyers, :longitude, :float
  end
end
