class WeatherTag < ActiveRecord::Base
      has_one :tag, :as => :taggable
end
