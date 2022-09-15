import { data } from "jquery";


// $(".my-form").on("submit", function(event){
$(".topic_button").on("submit", function(event){

  var users = document.querySelector(".add_topic")
  var topic_val = users.value;

//   var user_id = $(this).data('tp');
//   var row = $(this);

  event.preventDefault();

  $.ajax({
   url: "/topics/",
   type: "post",

   // dataType: 'json',
   //  accept: 'script',
  //  dataType : JSON,
   headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
   data: topic_val,
   // body: JSON.stringify(data),
   request : data.topic_name,

   success: function() {
      $("#topic").append(topic_val);
      alert(topic_val);
       alert('Yo success');
   },

  });
//   return response.json();
//   var response = data.topic_name;

});


