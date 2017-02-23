module LawyersHelper
  def laywers_payments_checkboxes_collection
    collection = []

    Lawyer::VALID_PAYMENT_METHODS.each do |payment_method|
      collection << [ payment_method, payment_label_for(payment_method)]
    end

    # => [ [:cash, "Cash"], [:transfer, "Transfert"], [:cb, "Carte bancaire"]  ]

    collection
  end

  def payment_label_for(payment_method)
    labels = {
      cash: "Cash",
      transfer: "Transfer",
      cb: "Credit Card",
    }


    labels.fetch(payment_method)
  end
end
