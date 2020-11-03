class AddWorkoutToWeeks < ActiveRecord::Migration[5.2]
  def change
    add_reference :weeks, :workout, foreign_key: true
  end
end
