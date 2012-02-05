// using jquery
$(document).ready(function() {
   
   // Enable/Disable new button
   $("#new_button").attr("disabled", "disabled");

   $('input').change(function(){
      var validated = true;

      if ($('#books').val().length === 0) validated = false;
      if (validated && $('#name').val().length === 0) validated = false;
      if (validated && $('#address').val().length === 0) validated = false;

      if (validated) $("#new_button").removeAttr("disabled");                              
   });

   $('input:first').trigger('change');
   
   
   // Calculating the price
   $('#books').change(function(){
      var myURL = 'api/price';
      var books = $('#books').val();
      
      $.getJSON(myURL, {"books":books}, function(data) {
         console.log(data);
         info = eval(data);
         $("#price").attr("value", info.price);
      });
   });
});
