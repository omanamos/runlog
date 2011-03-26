class CreateUserTags < ActiveRecord::Migration
  def self.up
    create_table :user_tags do |t|
      t.string :color, :null => false
      t.references :user, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :user_tags
  end
end
