class User < ActiveRecord::Base
  is_gravtastic!
  acts_as_authentic
  has_many :tabs
end
