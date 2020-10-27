class AddWeekToWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :weeks, :text, array: true, default: []
  end
end
