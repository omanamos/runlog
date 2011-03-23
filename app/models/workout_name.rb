class WorkoutName < ActiveRecord::Base
      has_many :sub_workouts
      validates_presence_of :content
end
