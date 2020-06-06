class TweetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tweet_by
end
