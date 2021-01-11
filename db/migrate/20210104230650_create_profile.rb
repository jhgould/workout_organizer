class CreateProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.float :height
      t.float :weight
      t.float :goal_weight
      t.references :user, foreign_key: true
    end
  end
end
