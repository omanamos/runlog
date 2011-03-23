class CreateAerobicWorkouts < ActiveRecord::Migration
  def self.up
    create_table :aerobic_workouts do |t|
      t.decimal :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :aerobic_workouts
  end
end
