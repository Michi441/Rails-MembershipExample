
// LOAD THE DOCUMENT VIA JQUERY & TURBOLINKS
$(document).on('turbolinks:load', function(){
  // GET THE PRO_FORM FROM _PRO_FORM.HTML.ERB
  var Form = $('#pro_form');

  // GET THE SUBMIT BUTTON IN THE _PRO_FORM.HTMl.ERB
  var SubmitBtn = $('#form-submit-btn');

  // SETUP THE STRIPE API KEY
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));

  // IF THE BUTTON GETS CLICKED
  SubmitBtn.click(function(event){

    // MAKE SURE ITS NOT EMPTY
    event.preventDefault();

    submitBtn.val('Processing').prop('disabled', true);

    // ASSIGN VARIABLES TO THE DATA INSIDE THE FIELDS
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();

    //USE STRIPE LIBRARY FOR ERRORS

    var error = false

    if(!Stripe.card.validateCardNumber(ccNum)){

      error = true;
      alert('The credit card seems to be invalid!');
    };

    if(!Stripe.card.validateCVC(cvcNum)){

      error = true;
      alert('The CVC seems to be invalid!');
    };

    if(!Stripe.card.validateExpiry(expMonth, expYear)){

      error = true;
      alert('The expiration date appears to be invalid!');
    };


    if(error){

      submitBtn.prop('disabled', false).val('Sign Up');
      // if there are errors, don't send it to stripe
    } else {
      // IF NOT, CREATE A TOKEN BASED ON THE VALUES OF THE VARIABLES.
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler)

    }




  });


function stripeResponseHandler(status, response){
  var token = response.id;

  Form.append($('<input type="hidden" name="user[stripe_card_token]">').val(token) );

  Form.get(0).submit();
}
});
