module FollowsHelper
  def find_name_user(list)
    User.find(list.user_id).name
  end
end
