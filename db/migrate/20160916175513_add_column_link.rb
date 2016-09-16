class AddColumnLink < ActiveRecord::Migration
  def change
    add_column :exercises, :link, :string
  end
end
