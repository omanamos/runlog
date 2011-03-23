class CreateWorkoutNames < ActiveRecord::Migration
  def self.up
    create_table :workout_names do |t|
      t.string :content, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_names
  end
end
