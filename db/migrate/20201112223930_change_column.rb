class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :exercises, :categroy, :category
  end
end
