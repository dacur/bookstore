jQuery ->
  Stripe.setPublishableKey('pk_test_cFzXGfqQNVCvN0FSkYTQm9zc')
  order.placeOrderForm()
order =
  placeOrderForm: ->
    $('#payment_form').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        console.log("process card")
        order.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    console.log(JSON.stringify(card))
    Stripe.createToken(card, order.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#user_stripe_customer_token').val(response.id)
      $('#payment_form')[0].submit()
    else
      alert(response.error.message)
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
