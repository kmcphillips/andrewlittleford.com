class RemovedEndsAt < ActiveRecord::Migration
  def self.up
    remove_column :events, :ends_at
  end

  def self.down
    add_column :events, :ends_at, :datetime
  end
end
