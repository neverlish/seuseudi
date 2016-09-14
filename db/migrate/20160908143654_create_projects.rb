class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :프로젝트명
      t.text :일정
      t.text :목표
      t.string :시작일자
      t.string :종료일자
      t.integer :인원
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
