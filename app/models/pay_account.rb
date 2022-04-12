class PayAccount < ActiveRecord::Base
  enum account_type: {bank_account: 1, debit_card: 2}

  validates :nickname, presence: true
  validates :account_number, presence: true
  validates :account_type, presence: true
end
