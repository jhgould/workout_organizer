class RemoveWorkoutsFromWeek < ActiveRecord::Migration[5.2]
  def change
    remove_column :weeks, :workouts, :string
  end
end
