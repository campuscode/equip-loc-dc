require 'rails_helper'

feature 'User view contracts' do
  scenario 'successfully' do
    contract = Contract.create(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')
    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.contact
  end

  scenario 'and view a list of contracts' do
    contract = Contract.create(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')

    another_contract = Contract.create(customer: 'Israel',
                            delivery_address: 'Rua dos Paulistanos, 100',
                            equipment: 'Furadeira 200 Watts',
                            rental_period: '15 dias',
                            amount: 100.00,
                            total_amount: 200.00,
                            discount: 50.00,
                            payment_method: 'à vista',
                            contact: 'Ronaldo')


    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.contact

    expect(page).to have_css('h2', text: another_contract.delivery_address)
    expect(page).to have_content another_contract.customer
    expect(page).to have_content another_contract.contact

  end

end