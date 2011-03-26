class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.date :date, :null => false
      t.references :loggable, :polymorphic => true
      t.references :user, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
