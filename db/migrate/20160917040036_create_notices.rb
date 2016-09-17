class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true


      t.timestamps
    end
  end
end
