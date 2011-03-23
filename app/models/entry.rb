class Entry < ActiveRecord::Base
      belongs_to :loggable, :polymorphic => true
      validates_presence_of :date
end
