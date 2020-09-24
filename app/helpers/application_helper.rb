module ApplicationHelper
  
  def price_mask_real(price)
    number_to_currency(price, unit: "R$", separator: ",", delimiter: ".")
  end
  
end
