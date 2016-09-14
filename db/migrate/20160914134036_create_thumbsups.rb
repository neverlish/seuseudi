class CreateThumbsups < ActiveRecord::Migration[5.0]
  def change
    create_table :thumbsups do |t|

    	t.belongs_to :user
    	t.belongs_to :result

      t.timestamps
    end
  end
end
