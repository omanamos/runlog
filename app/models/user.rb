class User < ActiveRecord::Base
      has_many :entries
      has_many :user_tags
      acts_as_authentic

      validates_presence_of :login, :email, :password, :role
end
