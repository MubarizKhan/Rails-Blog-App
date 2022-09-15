// import { data } from "jquery";

import { data } from "jquery";


// form = document.querySelector('.add_topic');
// alert('form submitted')
// Rails.fire(form, 'submit');

$(".topic_button").on("click",function(event){

  // debugger
  // var t_id = $(this).data('topic_name');
  // var t_id = $(".topic").val();
  // var row = $(this);
  // console.log(row);
  // alert(user_id);
  // {random_param: t_id}
  // var t_id = $(this).data(".add_topic");
  // var user_id = $(this).data('id');
  // var topic = $(".add_topic").val();
  // var row = $(".add_topic").data("test", {topic_name: "t_P"});
  var users = document.querySelector(".add_topic")
  var topic_val = users.value;
  alert(users.value);
  alert("prev must have shown users val");
  // var top = $(this).data('tp');
  event.preventDefault();

  $.ajax({

   url: "/topics/",

   type: "POST",
   dataType: "script",

  //  data : { topic: tp},
   headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'), // Optional
      'Content-Type': 'application/json'
   },
  //  data: {method: "POST"},

   beforeSend: function(xhr, textStatus){
      alert("Yo!");
      alert(xhr, textStatus);
   },

   success: function() {
      // var users = document.querySelector("#topic");
      $("#topic").append(users.value);
      // $(".topic").closest("li").add(users.value);
      // users.insertAdjacentHTML("beforeend", tp);
      // console.log(top, top.topic_name, 'yeeeeeeeeeeeeeeeeeeeeeee');
       alert('Yo success');
   },

   error: function(xhr, textStatus, error) {
     alert(xhr.statusText+""+textStatus+""+error);
   },

   complete: function(xhr, textStatus) {
    alert(xhr.statusText+""+textStatus+""+ "completion of request");
  }
});
//       type: "post",
//       url: "/topics/",
//       dataType: "script",
//       data: {random_param: t_id},
//       success: function(response) {
//       var response = data.random_param;
//         alert("response is =>", response)
//         element.addEventListener("ajax:success", (event) => {
//           $(".topic").closest("li").add(t_id);
//     },
//       error: function() {
//         alert("This is an error! boom", response);
//   }
// });

});


