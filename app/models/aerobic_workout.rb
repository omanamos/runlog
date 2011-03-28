class AerobicWorkout < SubWorkout
      has_one :sub_workout, :as => :workoutable, :dependent => :destroy
      has_many :splits, :order => "position", :dependent => :destroy
end
