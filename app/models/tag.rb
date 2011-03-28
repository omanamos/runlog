class Tag < ActiveRecord::Base
      has_and_belongs_to_many :workouts
      belongs_to :taggable, :polymorphic => true
      validates_presence_of :content, :taggable
end
