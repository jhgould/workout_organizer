class AddWorkoutsToWeeks < ActiveRecord::Migration[5.2]
  def change
    add_column :weeks, :workouts, :string
  end
end
