FactoryBot.define do
  factory :tweet do
    name { "MyString" }
    description { "MyText" }
    tweet_by { 1 }
  end
end
