class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :weight
      t.string :height
      t.string :age
      t.string :goal
    end
  end
end
