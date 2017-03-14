FactoryGirl.define do
  factory :contract do
    customer
    delivery_address "Avenida Paulista, 900"
    discount 0
    payment_method 'a prazo'
    contact "Fabio"
    rental_period 10
  end
end
