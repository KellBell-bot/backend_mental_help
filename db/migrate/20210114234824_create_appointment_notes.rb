class CreateAppointmentNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :appointment_notes do |t|
      t.text :notes
      t.references :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
