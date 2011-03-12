class RemoveRecordedAt < ActiveRecord::Migration
  def self.up
    remove_column :tracks, :recorded_at
  end

  def self.down
    add_column :tracks, :recorded_at, :date
  end
end
