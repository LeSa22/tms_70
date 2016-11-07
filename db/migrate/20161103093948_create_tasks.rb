class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :subject_id
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
