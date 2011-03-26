class UserTag < Tag
      belongs_to :user
      has_one :tag, :as => :taggable
      validates_presence_of :color
end
