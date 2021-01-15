class CreatePractitioners < ActiveRecord::Migration[6.0]
  def change
    create_table :practitioners do |t|
      t.string :name
      t.string :title
      t.text :description
      t.text :issues, array: true, default: []
      t.string :zip_code
      t.string :phone
      t.boolean :visited

      t.timestamps
    end
  end
end
