import { data } from "jquery";

console.log($('.my-form'))

$("form").on("submit", function(event){

  var users = document.querySelector(".add_topic")
  var topic_val = users.value;

  event.preventDefault();

  $.ajax({
   url: "/topics/",
   type: "post",

   headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
   data: { 'topic_name': topic_val },
   request : data.topic_name,

   success: function() {
      $("#topic").append(topic_val);
   },

  });
});


