class Workout < Entry
      has_one :entry, :as => :loggable
      has_and_belongs_to_many :tags
      has_many :sub_workouts
      validates_presence_of :date
end
