class UserSession < Authlogic::Session::Base
  include Authlogic::Monkeypatches
end