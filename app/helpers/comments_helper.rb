module CommentsHelper
  def can_destroy_comment(post)
    return current_user.id == post.user_id
  end
end
