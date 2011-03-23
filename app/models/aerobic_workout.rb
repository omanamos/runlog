class AerobicWorkout < SubWorkout
      has_one :sub_workout, :as => :workoutable
      has_many :splits, :order => "position"
end
