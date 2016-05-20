class CheckoutController < ActionController::Base

  def Rcheckout
    result = Braintree::Transaction.sale(
      :amount => "1234.00",
      :order_id => "cg2tzn",
      :payment_method_token => "cdwyqw",
      :recurring => true
      },
      :options => {
        :submit_for_settlement => true
      })
  end

  def Ocheckout
    result = Braintree::Transaction.sale(
      :amount => "1234.00",
      :order_id => "cg2tzn",
      :payment_method_token => "cdwyqw",
      :customer => {
        :first_name => "Allyson",
        :last_name => "Ooi",
        :company => "33 Ocean Pte Ltd",
        :phone => "92951201",
        :email => "allyson@33digital.io"
      },
      :options => {
        :submit_for_settlement => true
      })

    #result = Braintree::TestTransaction.settle(result.transaction.id)
    #result.success? == true
    #result.transaction.status == Braintree::Transaction::Status::Settled   (to force a settled status)

  end

  def rsubscription
    result = Braintree::Subscription.create(
      :payment_method_token => "cdwyqw",
      :plan_id => "gold",
      :price => "1200.00",
      :number_of_billing_cycles => 5,
    )
  end
end
