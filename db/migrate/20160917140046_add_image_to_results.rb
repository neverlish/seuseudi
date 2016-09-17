class AddImageToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :image, :string
  end
end
