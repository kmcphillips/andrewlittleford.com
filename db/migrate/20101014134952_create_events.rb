class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

    add_index :events, :starts_at
  end

  def self.down
    drop_table :events
  end
end
