class CreateWeatherTags < ActiveRecord::Migration
  def self.up
    create_table :weather_tags do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :weather_tags
  end
end
