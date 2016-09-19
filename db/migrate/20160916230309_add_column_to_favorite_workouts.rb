class AddColumnToFavoriteWorkouts < ActiveRecord::Migration
  def change
    create_table :favorite_workout_exercises do |t|
      t.integer :favorite_workout_id
      t.integer :exercise_id
    end
  end
end
