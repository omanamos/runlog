print "Creating admin..."

x = User.new(:first_name => "Ryan", :last_name => "Oman", :email => "omanamos@gmail.com", :login => "omanamos", :password =>"password", :password_confirmation => "password", :role => "admin")
x.save

puts "Success!"


print "Creating User Defined Tag..."

y = UserTag.new(:color => "FFFFFF", :user => x)
z = Tag.new(:content => "user tag 1", :taggable => y)
y.tag = z
y.save
z.save

puts "Success!"