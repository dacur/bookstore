jQuery ->
  Stripe.setPublishableKey('pk_test_cFzXGfqQNVCvN0FSkYTQm9zc')
  order.placeOrderForm()
console.log("hello")
order =
  placeOrderForm: ->
    console.log("PLACE ORDER FORM CALLED")
    $('#payment_form').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        order.processCard()
        false
      else
        true
  
  processCard: ->
    console.log("PROCESS CARD CALLED")
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    console.log(response)
    if status == 200
      $('#user_stripe_card_token').val(response.id)
      $('#payment_form')[0].submit()
    else
      alert(response.error.message)
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
