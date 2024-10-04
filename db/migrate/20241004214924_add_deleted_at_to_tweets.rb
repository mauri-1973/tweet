class AddDeletedAtToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :deleted_at, :datetime
  end
end
