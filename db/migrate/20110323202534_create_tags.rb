class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :content, :null => false
      t.string :color
      t.string :type, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
