class Split < ActiveRecord::Base
      belongs_to :aerobic_workout
      acts_as_list :scope => :aerobic_workout
end
