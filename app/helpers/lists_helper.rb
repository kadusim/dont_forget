module ListsHelper
  def setup_list(list)
    list.task.build
    list
  end
end
