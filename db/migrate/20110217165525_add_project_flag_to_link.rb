class AddProjectFlagToLink < ActiveRecord::Migration
  def self.up
    add_column :links, :project, :boolean, :default => false
    add_index :links, :project
  end

  def self.down
    remove_column :links, :project
  end
end
