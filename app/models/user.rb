class User < ActiveRecord::Base
	has_secure_password
  # has_one :schedule
  has_many :user_exercises
  has_many :exercises, :through => :user_exercises
<<<<<<< HEAD
  has_many :logs
  
=======
	has_many :user_favorite_workouts
	has_many :favorite_workouts, :through => :user_favorite_workouts

>>>>>>> sami

end
