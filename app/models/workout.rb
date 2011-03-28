class Workout < Entry
      has_one :entry, :as => :loggable, :dependent => :destroy
      has_and_belongs_to_many :tags
      has_many :sub_workouts, :dependent => :destroy
      validates_presence_of :date
end
