class User < ActiveRecord::Base
      has_many :entries, :dependent => :destroy
      has_many :user_tags, :dependent => :destroy
      acts_as_authentic

      validates_presence_of :login, :email, :password, :role, :first_name, :last_name
end
