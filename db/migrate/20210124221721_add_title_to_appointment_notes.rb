class AddTitleToAppointmentNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :appointment_notes, :title, :string
  end
end
