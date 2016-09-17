class CreateFavoriteWorkouts < ActiveRecord::Migration
  def change
    create_table :favorite_workouts do |t|
      t.integer :user_id
      t.string :rep
      t.string :set
    end
  end
end
