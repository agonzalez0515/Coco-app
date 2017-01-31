$(document).ready(function() {
  tagListener();
});

var tagListener = function() {
  $(".tag-btn").click(function(event) {
    event.preventDefault();
    var id = $(this).attr('id')
    $.ajax({
        url: ("/tags/" + id + "/like"),
        method: "put"
      }).done(function(response) {
        document.getElementById(id).innerHTML = (response.title + "   (" + response.count + ")")
      });
  })
};
