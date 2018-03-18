$(document).on('turbolinks:load', function(){

  var Form = $('#pro_form');
  var SubmitBtn = $('#form-submit-btn');
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));


  SubmitBtn.click(function(event){
    event.preventDefault();


    var ccNum = $('#card_number').val(),
      cvcNum = $('#card_code').val(),
      expMonth = $('#card_month').val(),
      expYear = $('#card_year').val();


    Stripe.createToken({
      number: ccNum,
      cvc: cvcNum,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler)
  });

});
