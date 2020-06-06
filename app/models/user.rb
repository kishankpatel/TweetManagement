class User < ApplicationRecord
  include Clearance::User
  has_many :tweets, class_name: 'Tweet', foreign_key: 'tweet_by'
end
