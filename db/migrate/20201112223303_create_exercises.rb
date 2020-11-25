class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :categroy
      t.string :muscle_group
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :rest_time
      t.integer :weight
      t.references :day, foreign_key: true
    end
  end
end
