class CreateExerciseTypes < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.integer :exercise_id
      t.integer :type_id
    end
  end
end
