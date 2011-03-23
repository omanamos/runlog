class CreateSplits < ActiveRecord::Migration
  def self.up
    create_table :splits do |t|
      t.decimal :distance
      t.integer :distance_units
      t.decimal :duration
      t.text :notes
      t.integer :position
      t.references :aerobic_workout, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :splits
  end
end
