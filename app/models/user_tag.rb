class UserTag < Tag
      belongs_to :user
      has_one :tag, :as => :taggable, :dependent => :destroy
      validates_presence_of :color, :user, :tag
end
