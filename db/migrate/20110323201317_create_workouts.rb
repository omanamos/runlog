class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.time :time_of_day
      t.text :description
      t.integer :effort
      t.integer :quality

      t.references :workoutable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
