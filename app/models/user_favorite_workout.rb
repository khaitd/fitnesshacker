class UserFavoriteWorkout < ActiveRecord::Base
  belongs_to :favorite_workout
  belongs_to :user
end
