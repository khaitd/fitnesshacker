class CreateUserFavoriteWorkouts < ActiveRecord::Migration
  def change
    create_table :user_favorite_workouts do |t|
      t.integer :user_id
      t.integer :favorite_workout_id
    end
  end
end
