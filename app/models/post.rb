class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter
    User.find(user_id).increment!(:posts_counter)
  end

  def recent_five_comments
    Comment.where(post_id: id).order(updated_at: :desc).limit(5)
  end
end