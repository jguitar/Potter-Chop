var globalURLPrice = 'api/price';
var globalURLOrder = 'api/order';

function calculatePrice() {
   var books = $('#books').val();
   
   $.getJSON(globalURLPrice, {"books":books}, function(data) {
      console.log(data);
      info = eval(data);
      $("#price").attr("value", info.price);
   });
}

function addOrder() {
   var books = $('#books').val();
   var name = $('#name').val();
   var address = $('#address').val();
   
   var order = {"books":books,"name":name,"address":address};
   
   $.post(globalURLOrder, order, function(data) {
      console.log(data);
      loadOrders();
   });
}

function validateNewOrder() {
   var validated = true;

   if ($('#books').val().length === 0) validated = false;
   if (validated && $('#name').val().length === 0) validated = false;
   if (validated && $('#address').val().length === 0) validated = false;
   
   return validated;
}

function addNewOrder(){
   if (validateNewOrder()) {
      addOrder();
   } else {
      alert("The order is not valid.");
      // Refactorizar y mostrar errores con javascript, más UX.
   }
}

function enablingNewButton(){
   if (validateNewOrder()) $("#new_button").removeAttr("disabled");                              
}

function loadOrders(){
   
   $.getJSON(globalURLOrder, function(data){
      console.log(data);
      books = eval(data);
      
      
      $('#orders').html("");
   
      $.each(books, function(i, book) {          
        var items = [];
       
         $.each(book, function(key, val) {          
           items.push('<li class="' + key + '">' + key + ': ' + val + '</li>');
         });
         
         $('<ul/>', {
            html: items.join('')
            }).appendTo('#orders'); 
      });
   });
}

$(document).ready(function() {
   $('input').change(enablingNewButton);
   $('#books').change(calculatePrice);
   $("#new_button").click(addNewOrder);
   
   $("#new_button").attr("disabled", "disabled");
   $('input:first').trigger('change');
   
   loadOrders();
});
