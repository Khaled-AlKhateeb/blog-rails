class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  def update_posts_counter
    User.find(user_id).increment!(:posts_counter)
  end

  def recent_five_comments
    Comment.where(post_id: id).order(updated_at: :desc).limit(5)
  end
end
