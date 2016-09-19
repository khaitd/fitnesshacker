class FavoriteWorkoutExercise < ActiveRecord::Base
  belongs_to :favorite_workout
  belongs_to :exercise
end
