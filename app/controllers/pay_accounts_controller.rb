require 'loan_account'

class PayAccountsController < ApplicationController

  # TODO: Add lookup to Account class

  def index
    @loan_account = LoanAccount.new
    @new_pay_account = PayAccount.new
    @pay_accounts = PayAccount.all
  end

  def create
    attributes = params.require(:pay_account).permit(:nickname, :account_number, :account_type)
    attributes[:account_type] = PayAccount.account_types.values.find{ |v| v.to_s == attributes[:account_type] } || attributes[:account_type]
    pay_account = PayAccount.new(attributes)
    valid = pay_account.save
    pay_account_in_form = valid ? PayAccount.new : pay_account
    form = render_to_string partial: "pay_account_form", locals: {pay_account: pay_account_in_form}, layout: false
    json = {valid: valid, form: form}
    if valid
      row = render_to_string partial: "pay_account_row", locals: {pay_account: pay_account}, layout: false
      json[:row] = row
    end
    render json: json
  end

end
