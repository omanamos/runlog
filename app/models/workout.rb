class Workout < ActiveRecord::Base
      has_one :entry, :as => :loggable
      belongs_to :workoutable, :polymorphic => true
      has_and_belongs_to_many :tags
end
