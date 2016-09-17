class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :프로젝트명
      t.text :소개
      t.text :소감
      t.string :시작일자
      t.string :종료일자
      t.string :attachment
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
