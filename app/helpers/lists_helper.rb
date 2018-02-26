module ListsHelper
  def setup_list(list)
    list.task.build
    puts "#{list.task.inspect}"
    list
  end
end
