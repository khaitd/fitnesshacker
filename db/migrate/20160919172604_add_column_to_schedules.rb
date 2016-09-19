class AddColumnToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :monday, :string
    add_column :schedules, :tuesday, :string
    add_column :schedules, :wednesday, :string
    add_column :schedules, :thursday, :string
    add_column :schedules, :friday, :string
    add_column :schedules, :saturday, :string
    add_column :schedules, :sunday, :string

  end
end
