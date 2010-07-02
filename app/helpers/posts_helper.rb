module PostsHelper
  def authorname(post)
    return "" if post.user_id.blank?
    user = User.find(post.user_id)
    user.login
  end


  def owner(post)
    return current_user.id == post.user_id
  end
end
