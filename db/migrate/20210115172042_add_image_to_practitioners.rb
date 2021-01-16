class AddImageToPractitioners < ActiveRecord::Migration[6.0]
  def change
    add_column :practitioners, :image, :string
  end
end
