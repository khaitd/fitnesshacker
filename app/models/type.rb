class Type < ActiveRecord::Base
  has_many :exercise_types
  has_many :exercises, :through => :exercise_types
end
