class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :name
      t.integer :set
      t.integer :rep 
      t.timestamps
    end
  end
end
