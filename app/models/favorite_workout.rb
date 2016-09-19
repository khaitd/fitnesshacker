class FavoriteWorkout < ActiveRecord::Base
  has_many :favorite_workout_exercises
  has_many :exercises, :through => :favorite_workout_exercises
  has_many :user_favorite_workouts
  has_many :users, :through => :user_favorite_workouts
end
