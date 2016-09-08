class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :프로젝트명
      t.string :일정
      t.string :목표

      t.timestamps
    end
  end
end
