class CreateRemarks < ActiveRecord::Migration[5.0]
  def change
    create_table :remarks do |t|
      t.text :body
      t.references :result, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
