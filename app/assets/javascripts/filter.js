$(document).on("turbolinks:load", function(){
  $("#search").on("keyup", function(){
    var content = $(this).val().toLowerCase();
    $("#usersTable tr").filter(function(){
      $(this).toggle($(this).text().toLowerCase().indexOf(content) > -1)
    });
  });
});
