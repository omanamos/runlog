class SubWorkout < ActiveRecord::Base
      belongs_to :workout
      belongs_to :workoutable, :polymorphic => true
      belongs_to :workout_name
      belongs_to :workout_type
      validates_presence_of :workout, :workoutable, :workout_name, :workout_type, :duration
end
