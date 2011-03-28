class WeatherTag < Tag
      has_one :tag, :as => :taggable, :dependent => :destroy
end
