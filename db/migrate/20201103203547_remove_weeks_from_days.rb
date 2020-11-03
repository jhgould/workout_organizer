class RemoveWeeksFromDays < ActiveRecord::Migration[5.2]
  def change
    remove_reference :days, :weeks, foreign_key: true
  end
end
