module ListsHelper
  def link_to_add_task(name, task, association)
    new_object = task.object.send(association).klass.new
    html = task.fields_for(association, new_object, child_index: "new_id") do |builder|
      render(association.to_s.singularize + "_fields", task: builder)
    end
    link_to(name, '#', onclick: "add_task(this, '#{escape_javascript(html)}'); return false;")
  end

  def link_to_remove_task(name, field)
    if field.object.class == Task
      field.hidden_field(:_destroy, as: :hidden) + link_to(name, '#', onclick: "remove_task(this); return false;")
    else
      field.hidden_field(:_destroy, as: :hidden) + link_to(name, '#', onclick: "remove_subtask(this); return false;")
    end
  end
end
