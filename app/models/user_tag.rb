class UserTag < ActiveRecord::Base
      has_one :tag, :as => :taggable
end
