class StrengthWorkout < SubWorkout
      has_one :sub_workout, :as => :workoutable
end
