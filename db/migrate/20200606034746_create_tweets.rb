class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :description
      t.integer :tweet_by

      t.timestamps
    end
  end
end
