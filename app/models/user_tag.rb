class UserTag < Tag
      has_one :tag, :as => :taggable
      validates_presence_of :color
end
