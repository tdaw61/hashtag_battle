class AddCountAndLastTweetIDtoHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :count, :integer
    add_column :hashtags, :last_tweet_id, :integer
  end
end
