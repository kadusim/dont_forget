function add_task(element, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_id", "g")
	var new_content = content.replace(regexp, new_id);
	$(element).parent().before(new_content);
}

function remove_task(element) {
	$(element).prev("input[type=hidden]").val("1");
	$(element).closest(".task_item").hide();
}

function remove_subtask(element) {
	$(element).prev("input[type=hidden]").val("1");
	$(element).closest(".subtask_item").hide();
}
