jQuery(function($) {
  console.log($('meta[name="stripe-key"]').attr('content'));
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  $('#new_order').submit(function(event) {
    event.preventDefault();
    var $form = $(this);
    $form.find('button').attr('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler);
    return false;
  });
});


function stripeResponseHandler(status, response) {
  var $form = $('#new_order');

  if (response.error) {
    console.log(response.error);
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').attr('disabled', false);
  } else {
    console.log(response.id);
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="order[stripe_token]" id="order_stripe_token" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};
