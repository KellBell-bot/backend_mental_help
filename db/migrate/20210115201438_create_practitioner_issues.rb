class CreatePractitionerIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :practitioner_issues do |t|
      t.references :practitioner, null: false, foreign_key: true
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
