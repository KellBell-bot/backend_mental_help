class RemovePractitionerFromAppointmentNotes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :appointment_notes, :practitioner, null: false, foreign_key: true
  end
end
