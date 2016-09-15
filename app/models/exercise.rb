class Exercise < ActiveRecord::Base
  has_many :user_exercises
  has_many :exercise_types
  has_many :types, :through => :exercise_types 
  has_many :users, :through => :user_exercises
end
