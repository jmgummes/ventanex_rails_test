function payAccountIndexReady() {
  $('#new-pay-account-button').click(newPayAccountButtonClicked);
  $('#new-pay-account-form').on('ajax:success', payAccountCreationSuccessfulResponseReceived);
  $('.obfuscation-button').click(obfuscationButtonClicked);
  
  function newPayAccountButtonClicked(obfuscationButtonClicked) {
    $('#new-pay-account-modal').modal('show');
  }

  function payAccountCreationSuccessfulResponseReceived(event) {
    const [data, status, xhr] = event.detail;
    $("#new-pay-account-form").html(data.form);
    if(data.valid) {
      $('#new-pay-account-modal').modal('hide');
      $('#pay-accounts-tbody').append(data.row);
    }
  }
  
  function obfuscationButtonClicked() {
    $(this).parent().children().toggle();
  }
}
