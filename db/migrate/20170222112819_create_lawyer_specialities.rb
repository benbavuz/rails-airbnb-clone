class CreateLawyerSpecialities < ActiveRecord::Migration[5.0]
  def change
    create_table :lawyer_specialities do |t|
      t.references :lawyer, foreign_key: true
      t.references :speciality, foreign_key: true

      t.timestamps
    end
  end
end
