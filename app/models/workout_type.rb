class WorkoutType < ActiveRecord::Base
      has_many :sub_workouts, :dependent => :nullify
      validates_presence_of :content
end
