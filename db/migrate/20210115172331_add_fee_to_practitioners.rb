class AddFeeToPractitioners < ActiveRecord::Migration[6.0]
  def change
    add_column :practitioners, :fee, :string
  end
end
