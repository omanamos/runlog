class WeatherTag < Tag
      has_one :tag, :as => :taggable
end
