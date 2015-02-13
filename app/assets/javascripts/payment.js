$(document).ready(function() {
  subscription = {
    setupForm: function() {
      $('#new_subscription').submit(function(e) {
        e.preventDefault();
        $('input[type=submit]').attr('disabled', true);
        subscription.processCard();
      });
    },
    processCard: function() {
      var card;
      card = {
        name: $('#name_of_card').val(),
        number: $('#credit_card_number').val(),
        cvc: $('#security_code').val(),
        expMonth: $('#card_month').val(),
        expYear: $('#card_year').val()
      };
      return Stripe.createToken(card, subscription.handleStripeResponse);
    },
    handleStripeResponse: function(status, response) {
      if (status === 200) {
        $('#stripe_card_token').val(response.id);
        return $('#new_subscription')[0].submit();
      } else {
        $('#stripe_error').text(response.error.message);
        return $('input[type=submit]').attr('disabled', false);
      }
    }
  };
  subscription.setupForm();
});
