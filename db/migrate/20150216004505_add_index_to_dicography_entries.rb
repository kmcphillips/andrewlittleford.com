class AddIndexToDicographyEntries < ActiveRecord::Migration
  def change
    add_index :discography_entries, :sort_order
  end
end
