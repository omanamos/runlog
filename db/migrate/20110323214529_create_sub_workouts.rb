class CreateSubWorkouts < ActiveRecord::Migration
  def self.up
    create_table :sub_workouts do |t|
      t.decimal :duration, :null => false
      t.decimal :distance
      t.integer :distance_units
      t.integer :avr_hr
      t.integer :max_hr
      t.text :notes
      
      t.references :workout, :null => false
      t.references :workoutable, :polymorphic => true, :null => false
      t.references :workout_name, :null => false
      t.references :workout_type, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_workouts
  end
end
