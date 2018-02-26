// $(document).ready(function() {
//   $('#new-task').click(function() {
//     // console.log($('#tab-task input:last').val())
//     // console.log($('#tab-task input:last').attr('name'))
//     // Buscar ultima task criada, pegar o id para adicionar a nova e somar 1
//     last_id_task = parseInt($('#tab-task input:last').val()) + 1
//     // Buscar ultima task criada e pegar o name para adicionar a nova
//     last_name_task = $('#tab-task input:last').attr('name')
//     // Busca no name o numero do ultimo indice criado na #tab-task, Padrao do nome "list[task_attributes][2][id]"
//     regExp = /[0-9]/
//     last_id_table_reg = regExp.exec(last_name_task)
//     // Somar 1 no id
//     last_id = parseInt(last_id_table_reg[0]) + 1
//     console.log(last_id);
//     // console.log(last_id_table_reg[0])
//     // console.log(last_id_table_reg)
//     $('#tab-task').append(
//       '<tr>' +
//         '<td><input name="list[task_attributes][' + last_id + '][status]" type="hidden" value="pend" /><input type="checkbox" value="done" name="list[task_attributes][' + last_id + '][status]" id="list_task_attributes_' + last_id + '_status" /></td>' +
//         '<td><input type="text" value="Type here..." name="list[task_attributes][' + last_id + '][description]" id="list_task_attributes_' + last_id + '_description" /></td>' +
//         '<td><input type="text" value="Type here...." name="list[task_attributes][' + last_id + '][father_id]" id="list_task_attributes_' + last_id + '_father_id" /></td>' +
//         '<td>pend</td>' +
//         '<td><input name="list[task_attributes][' + last_id + '][_destroy]" type="hidden" value="0" /><input type="checkbox" value="1" name="list[task_attributes][' + last_id + '][_destroy]" id="list_task_attributes_' + last_id + '__destroy" /></td>' +
//       '</tr>' +
//       '<input type="hidden" value="' + last_id_task + '" name="list[task_attributes][' + last_id + '][id]" id="list_task_attributes_' + last_id + '_id" />'
//     )
//   })
//
// })
