class RemoveWeeksFromWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :weeks, :text
  end
end
